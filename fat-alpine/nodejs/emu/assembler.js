const readline = require('readline');

const {
	status,
	help,
	exit
} = require('./cmd_general');

const{
	loadx,
	loady,
	addx,
	addy,
	nop,
	inc,
	dec,
	clearFlag
	
} = require('./cmd_mnemonics');

global.registers = {

  PC: 0,      // Program Counter (8-bit)
  XR: 0,       // X Register (8-bit)
  YR: 0,       // Y Register (8-bit)
  SP: 0,      // Stack Pointer (8-bit)
  flags: {
    carry: false,       // Carry Flag
    zero: false,        // Zero Flag
    overflow: false,    // Overflow Flag
    negative: false,     // Negative Flag
    error: false     
  }
};

global.ram = Array.from({ length: 100 }, (_, index) => `Element ${index + 1}`);

global.stack = Array.from({ length: 50 }, (_, index) => `Element ${index + 1}`);

global.program_mem = Array.from({ length: 100 }, (_, index) => `Element ${index + 1}`);

// Define the interpreter function
function interpretCommand(command) {
  // Split the command into individual words
  const words = command.trim().split(' ');

  // Determine the number of words in the command
  const numWords = words.length;

  // Interpret the command based on the number of words
  if (numWords === 1) {
    // Handle single-word commands
    const [word1] = words;

    if (word1.toLowerCase() === 'help') {
      help();
      // Perform the appropriate action for the 'help' command
    } else if (word1.toLowerCase() === 'quit' || word1.toLowerCase() === 'exit') {
		exit();
    } else if (word1.toLowerCase() === 'status') {
		status();
    } else if (word1.toLowerCase() === 'nop') {
		nop();
    } else {
      console.log('Invalid command');
    }
  } else if (numWords === 2) {
    // Handle two-word commands
    const [word1, word2] = words;

	if (word1.toLowerCase() === 'clear') {
      clearFlag(word2);
    } 
	else if (word1.toLowerCase() === 'inc' && word2.toLowerCase() === 'x') {
      inc('x');
    } 	 
	else if (word1.toLowerCase() === 'inc' && word2.toLowerCase() === 'y') {
      inc('y');
    } 	
	else if (word1.toLowerCase() === 'dec' && word2.toLowerCase() === 'x') {
      dec('x');
    } 	 
	else if (word1.toLowerCase() === 'dec' && word2.toLowerCase() === 'y') {
      dec('y');
    } 	
	else {
      console.log('Invalid command');
    }
  } else if (numWords === 3) {
    // Handle three-word commands
    const [word1, word2, word3] = words;

    if (word1 === 'load' && word2 === 'x') {
       loadx(word3);
    } else if (word1 === 'load' && word2 === 'y') {
       loady(word3);
    } else if (word1 === 'add' && word2 === 'x') {
       addx(word3);
    } else if (word1 === 'add' && word2 === 'y') {
       addy(word3);
    } else {
      console.log('Invalid command');
    }
  } else {
    console.log('Invalid command');
  }
}


const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Function to read and interpret commands
function readCommands() {
  rl.question('Enter a command: ', (command) => {
    interpretCommand(command);

    // Continue reading commands recursively
    readCommands();
  });
}

// Start reading commands
readCommands();
