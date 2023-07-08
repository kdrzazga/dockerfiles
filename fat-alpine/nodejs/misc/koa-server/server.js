const Koa = require('koa');
const Router = require('koa-router');
const app = new Koa();
const router = new Router();

// List to store numbers
const numbers = [];

// POST endpoint
router.post('/:number', (ctx) => {
  const { number } = ctx.params;

  if (isNaN(number)) {
    ctx.status = 400;
    ctx.body = 'Bad Request';
    return;
  }

  numbers.push(Number(number));
  ctx.body = 'Number added successfully';
});

// Register router middleware
app.use(router.routes()).use(router.allowedMethods());

// Start the server
app.listen(3002, () => {
  console.log('Server listening on port 3002');
});
