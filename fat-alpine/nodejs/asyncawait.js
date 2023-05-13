function resolveAfterDelay(delay) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(`Resolved after ${delay} milliseconds`);
    }, delay); //promise that resolves after a specified delay.
  });
}

async function asyncFunction() {
  try {
    console.log("Before await");
    const result1 = await resolveAfterDelay(2000);
    console.log(result1);

    console.log("After first await");
    const result2 = await resolveAfterDelay(3000);
    console.log(result2);

    console.log("After second await");
  } catch (error) {
    console.log("An error occurred:", error);
  }
}

asyncFunction();

/*
In JavaScript, the `async` and `await` keywords are used in combination with Promises to handle asynchronous operations in a more concise and readable manner. While you could use `setTimeout` or a similar function like `sleep` to introduce delays, it wouldn't provide the same benefits as `async` and `await`. Here's why `async` and `await` are special:

1. **Simplified syntax**: `async` and `await` allow you to write asynchronous code using a more synchronous coding style, avoiding complex callback structures or chaining `.then()` methods.

2. **Sequential execution**: With `await`, you can pause the execution of an `async` function until a Promise is resolved, making it easier to perform asynchronous operations sequentially. This helps avoid callback hell or deeply nested code.

3. **Error handling**: `async` functions can use regular `try`/`catch` blocks to handle errors. This simplifies error handling, making it more straightforward and similar to synchronous code.

4. **Promise-based**: `async` functions inherently work with Promises, allowing you to take advantage of the rich ecosystem of asynchronous libraries and functions built around Promises.

5. **Return values**: `await` allows you to capture the resolved value of a Promise directly, simplifying code that depends on the result of asynchronous operations.

Using `setTimeout` or similar functions for delays would introduce manual management of timeouts and callbacks, making the code more complex and less readable. On the other hand, `async` and `await` provide a structured and intuitive way to handle asynchronous operations, improving code readability and maintainability.

It's worth noting that `async` and `await` are not limited to waiting for delays. They can be used with any asynchronous operation that returns a Promise, such as making HTTP requests, reading/writing files, interacting with databases, or performing complex calculations asynchronously.
*/