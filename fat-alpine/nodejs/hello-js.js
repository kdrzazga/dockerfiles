// 1. String.prototype.slice()
const str = 'Hello, World!';
const sliced = str.slice(7, 12);
console.log(sliced); // "World"

// 2. Math.abs()
const num = -5;
const absolute = Math.abs(num);
console.log(absolute); // 5

// 3. Array.prototype.includes()
const array = [1, 2, 3, 4, 5];
const includesThree = array.includes(3);
console.log(includesThree); // true

// 4. Math.random()
const randomNum = Math.random();
console.log(randomNum); // Random number between 0 and 1

// 5. Date.now()
const currentTime = Date.now();
console.log(currentTime); // Current timestamp in milliseconds

// 6. Array.prototype.reverse()
const originalArray = [1, 2, 3, 4, 5];
const reversedArray = originalArray.reverse();
console.log(reversedArray); // [5, 4, 3, 2, 1]

// 7. JSON.stringify()
const obj = { name: 'John', age: 30 };
const jsonString = JSON.stringify(obj);
console.log(jsonString); // "{"name":"John","age":30}"

// 8. Array.prototype.join()
const fruits = ['Apple', 'Banana', 'Orange'];
const joinedString = fruits.join(', ');
console.log(joinedString); // "Apple, Banana, Orange"

// 9. RegExp.prototype.test()
const regex = /\d+/; // Matches one or more digits
const hasDigits = regex.test('Hello123');
console.log(hasDigits); // true

// 10. Object.keys()
const person = { name: 'John', age: 30, city: 'New York' };
const keys = Object.keys(person);
console.log(keys); // ["name", "age", "city"]
