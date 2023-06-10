// shape.spec.js

const {
  rectangleSurface,
  rectanglePerimeter,
  circleSurface,
  circlePerimeter,
  triangleSurface,
  trianglePerimeter,
  trapezoidSurface,
  trapezoidPerimeter
} = require('./shape');

describe('Shape functions', () => {
  // Rectangle tests
  describe('Rectangle', () => {
    it('should calculate the surface area of a rectangle', () => {
      expect(rectangleSurface(5, 6)).toEqual(30);
    });

    it('should calculate the perimeter of a rectangle', () => {
      expect(rectanglePerimeter(5, 6)).toEqual(22);
    });
  });

  // Circle tests
  describe('Circle', () => {
    it('should calculate the surface area of a circle', () => {
      expect(circleSurface(3)).toBeCloseTo(28.274, 3);
    });

    it('should calculate the perimeter of a circle', () => {
      expect(circlePerimeter(3)).toBeCloseTo(18.849, 3);
    });
  });

  // Triangle tests
  describe('Triangle', () => {
    it('should calculate the surface area of a triangle', () => {
      expect(triangleSurface(4, 5)).toEqual(10);
    });

    it('should calculate the perimeter of a triangle', () => {
      expect(trianglePerimeter(3, 4, 5)).toEqual(12);
    });
  });

  // Trapezoid tests
  describe('Trapezoid', () => {
    it('should calculate the surface area of a trapezoid', () => {
      expect(trapezoidSurface(2, 4, 3)).toEqual(9);
    });

    it('should calculate the perimeter of a trapezoid', () => {
      expect(trapezoidPerimeter(2, 4, 3, 5)).toEqual(14);
    });
  });
});
