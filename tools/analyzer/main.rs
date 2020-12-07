use std::env;
use std::fs;
use std::io::ErrorKind;
use std::path::PathBuf;
use std::process::Command;

// TODO(david): This shells out to an expected rule in the workspace root //:rust_analyzer that the user must define.
// It would be more convenient if it could automatically discover all the rust code in the workspace if this target does not exist.
fn main() {
    let repo_root = workspace_dir().expect(
        "Could not determine workspace, are you running inside a directory with WORKSPACE?",
    );
    let bazel_command = env::var("BAZEL_COMMAND").unwrap_or_else(|_| "bazel".into());
    let analyzer_target =
        env::var("BAZEL_ANALYZER_TARGET").unwrap_or_else(|_| "//:rust_analyzer".into());

    env::set_current_dir(&repo_root).expect(
        format!(
            "could not access workspace directory: {}",
            repo_root.to_string_lossy()
        )
        .as_str(),
    );
    let output = Command::new(bazel_command)
        .arg("build")
        .arg(&analyzer_target)
        .output()
        .expect("failed to execute bazel process");
    if !output.status.success() {
        panic!(
            "bazel build failed:({}) of {}:\n{}",
            output.status,
            analyzer_target,
            std::str::from_utf8(&output.stderr).unwrap()
        );
    }

    let generated_rust_project = repo_root.join("bazel-bin/rust-project.json");
    let workspace_rust_project = repo_root.join("rust-project.json");
    let canonical_exec_root = fs::canonicalize(repo_root.join(format!(
        "bazel-{}",
        repo_root.file_name().unwrap().to_string_lossy()
    )))
    .expect("could not canonicalize exec_root");

    // The generated_rust_project has a template string we must replace with the workspace name.
    let generated_json = fs::read_to_string(&generated_rust_project)
        .expect("failed to read generated rust-project.json");

    // It's OK if the file doesn't exist.
    match fs::remove_file(&workspace_rust_project) {
        Ok(_) => {}
        Err(err) if err.kind() == ErrorKind::NotFound => {},
        Err(_) => panic!("Unexpected error removing old rust-project.json"),
    }
    fs::write(
        workspace_rust_project,
        generated_json.replace("__EXEC_ROOT__", &canonical_exec_root.to_string_lossy()),
    )
    .expect("failed to write workspace rust-project.json");
}

fn workspace_dir() -> Option<PathBuf> {
    if let Ok(ws_dir) = env::var("BUILD_WORKSPACE_DIRECTORY") {
        Some(PathBuf::from(ws_dir))
    } else {
        let mut maybe_cwd = env::current_dir().ok();
        while let Some(cwd) = maybe_cwd {
            let mut workspace_path = cwd.clone();
            workspace_path.push("WORKSPACE");
            if workspace_path.is_file() {
                return Some(PathBuf::from(cwd));
            }
            maybe_cwd = cwd.parent().map(PathBuf::from);
        }
        None
    }
}
