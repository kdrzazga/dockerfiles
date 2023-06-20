const { exec } = require('child_process');

exec('pkill -f node', (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing command: ${error}`);
    return;
  }
  
  if (stderr) {
    console.error(`Command stderr: ${stderr}`);
    return;
  }
  
  console.log(`Node.js processes killed successfully.`);
});
