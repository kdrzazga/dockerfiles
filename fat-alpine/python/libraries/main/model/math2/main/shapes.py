import math
from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def perimeter(self):
        pass

    @abstractmethod
    def surface(self):
        pass


class Triangle(Shape):
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def perimeter(self):
        return self.a + self.b + self.c

    def surface(self):
        s = self.perimeter() / 2
        return math.sqrt(s * (s - self.a) * (s - self.b) * (s - self.c))


class Rectangle(Shape):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def perimeter(self):
        return 2 * (self.a + self.b)

    def surface(self):
        return self.a * self.b


class Circle(Shape):
    def __init__(self, r):
        self.r = r

    def perimeter(self):
        return 2 * math.pi * self.r

    def surface(self):
        return math.pi * self.r ** 2


class Trapeze(Shape):
    def __init__(self, a, b, h, alpha):
        self.a = a
        self.b = b
        self.h = h
        self.alpha = alpha

    def perimeter(self):
        return self.a + self.b + 2 * self.h / math.tan(math.radians(self.alpha))

    def surface(self):
        return (self.a + self.b) * self.h / 2
