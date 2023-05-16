import fs from 'fs';

const filePath = 'info.txt';

fs.readFile(filePath, 'utf8', (error, data) => {
  if (error) {
    console.error('Error reading file:', error);
    return;
  }

  console.log('File content:', data);
});
