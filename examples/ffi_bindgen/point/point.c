#include "point.h"

#include <stdlib.h>

Point* point_new(float x, float y) {
  Point* point = (Point*)malloc(sizeof(*point));
  point->x = x;
  point->y = y;

  return point;
}