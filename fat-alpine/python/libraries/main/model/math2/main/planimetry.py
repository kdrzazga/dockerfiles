class LineSegment:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def intersect(self, other):
        d = (self.a.x - self.b.x) * (other.a.y - other.b.y) - (self.a.y - self.b.y) * (other.a.x - other.b.x)
        if d == 0:
            return None # lines are parallel or coincident
        t = ((self.a.x - other.a.x) * (other.a.y - other.b.y) - (self.a.y - other.a.y) * (other.a.x - other.b.x)) / d
        x = self.a.x + t * (self.b.x - self.a.x)
        y = self.a.y + t * (self.b.y - self.a.y)
        return Point(x, y)


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y


if __name__ == '__main__':
    # create two lines
    line1 = LineSegment(Point(0, 0), Point(1, 1))
    line2 = LineSegment(Point(0, 1), Point(1, 0))

    # compute intersection point
    intersection = line1.intersect(line2)

    # print result
    if intersection is not None:
        print(f"Intersection: ({intersection.x}, {intersection.y})")
    else:
        print("Line segments are parallel or coincident")
