function rectangleSurface(width, height) {
  return width * height;
}

function rectanglePerimeter(width, height) {
  return 2 * (width + height);
}

function circleSurface(radius) {
  return Math.PI * Math.pow(radius, 2);
}

function circlePerimeter(radius) {
  return 2 * Math.PI * radius;
}

function triangleSurface(base, height) {
  return (base * height) / 2;
}

function trianglePerimeter(side1, side2, side3) {
  return side1 + side2 + side3;
}

function trapezoidSurface(base1, base2, height) {
  return ((base1 + base2) * height) / 2;
}

function trapezoidPerimeter(base1, base2, side1, side2) {
  return base1 + base2 + side1 + side2;
}

// Example usage
console.log(rectangleSurface(5, 10)); // 50
console.log(rectanglePerimeter(5, 10)); // 30
console.log(circleSurface(3)); // 28.274333882308138
console.log(circlePerimeter(3)); // 18.84955592153876
console.log(triangleSurface(4, 6)); // 12
console.log(trianglePerimeter(3, 4, 5)); // 12
console.log(trapezoidSurface(6, 10, 4)); // 28
console.log(trapezoidPerimeter(6, 10, 5, 7)); // 28
