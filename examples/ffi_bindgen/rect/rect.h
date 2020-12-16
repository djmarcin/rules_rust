#include "point/point.h"

typedef struct {
  Point* ll;
  Point* lr;
  Point* ul;
  Point* ur;
} Rect;

Rect* rect_new(Point* ll, Point* lr, Point* ul, Point* ur);
