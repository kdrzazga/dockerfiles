npm install --save-dev jest //needed to run all files from signle file, mentioned in package.json

npm init playwright@latest -y
npx playwright test
npx playwright test --ui

npx playwright test --grep "page title"

npx playwright show-report
