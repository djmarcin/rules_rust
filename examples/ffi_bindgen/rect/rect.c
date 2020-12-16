#include "rect.h"

#include <stdlib.h>

Rect* rect_new(Point* ll, Point* lr, Point* ul, Point* ur) {
  Rect* rect = (Rect*)malloc(sizeof(*rect));
  rect->ll = ll;
  rect->lr = lr;
  rect->ul = ul;
  rect->ur = ur;

  return rect;
}