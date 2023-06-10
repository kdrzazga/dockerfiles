const fs = require('fs');

// Read file asynchronously
fs.readFile('JC_DeBelloGallico.txt', 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading file:', err);
    return;
  }

  // Split the file contents by line into an array
  const lines = data.split('\n');

  // Display the array of lines
  console.log(lines.filter((line) => line.length > 0 ));
  
  const regExp = '/Gall[a-z]*/g';
});
