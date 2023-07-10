const { exec } = require('child_process');

function runHaskellProgram(programFile) {
  return new Promise((resolve, reject) => {
    const command = `ghci ${programFile}`;
    exec(command, (error, stdout, stderr) => {
      if (error) {
        reject(error);
      } else if (stderr) {
        reject(new Error(stderr));
      } else {
        resolve(stdout);
      }
    });
  });
}

const programFile = 'program.hs';

runHaskellProgram(programFile)
  .then((output) => {
    console.log(output);
  })
  .catch((error) => {
    console.error(error);
  });
