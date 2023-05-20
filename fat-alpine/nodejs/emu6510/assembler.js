const fs = require('fs');

global.registers = {

  PC: 0,      // Program Counter (16-bit)
  AC: 0,       // Accumulator (8-bit)
  XR: 0,       // X Register (8-bit)
  YR: 0,       // Y Register (8-bit)
  SP: 0,      // Stack Pointer (8-bit)
  flags: {
    carry: false,       // Carry Flag
    zero: false,        // Zero Flag
    interrupt: false,   // Interrupt Disable Flag
    decimal: false,     // Decimal Mode Flag
    break: false,       // Break Command Flag
    overflow: false,    // Overflow Flag
    negative: false     // Negative Flag
  }
};

function printProcessorStatus(registers) {
  const divider = '+---------------------------------------+';
  const line = '|PC'.padEnd(6, ' ') + '| AC'.padEnd(6, ' ') + '| XR'.padEnd(6, ' ')+ '| YR'.padEnd(6, ' ')+ '| SP'.padEnd(6, ' ') + '|NV#BDIZC |';

  const values = `|$${global.registers.PC.toString(16).padStart(4, '0')}| $${global.registers.AC.toString(16).padStart(2, '0')} | $${global.registers.XR.toString(16).padStart(2, '0')} | $${global.registers.YR.toString(16).padStart(2, '0')} | $${global.registers.SP.toString(16).padStart(2, '0')} |${parseInt(global.registers.flags, 2).toString(2).padStart(8, '0')} |`;

  console.log(divider);
  console.log(line);
  console.log(divider);
  console.log(values);
  console.log(divider);
}

function findStart(lines){
  for (let i = 0; i < lines.length; i++) {
   let line = lines[i].replace(/ /g, '');
   if (line.startsWith('*=$')) {
     line = line.replace('*=$', '');
     global.registers.PC = parseInt(line, 16);
   }
  }	
}

function analyzeProgram(lines){
	findStart(lines);
	
  for (let i = 1; i < lines.length; i++) {
	
	const instruction = lines[i].split(' ')[0];
	
	if (instruction.startsWith('#$')) {
      // Memory usage for '#$xx' (1-byte immediate value)
      global.registers.PC += 1 + 1;
    } else if (instruction.startsWith('$')) {
      // Memory usage for '$xxxx' (2-byte address)
      global.registers.PC += 2 + 1;
    } else {
      // Memory usage for other instructions (1 byte)
      global.registers.PC += 1;
    }
  }	
}

//program
try {
  const data = fs.readFileSync('program.ass', 'utf8');
  const lines = data.split('\r\n');

  // Accessing and modifying the registers
  global.registers.AC = 42;   // Set A register to 42
  global.registers.XR = 10;   // Set X register to 10
  global.registers.SP = 255;  // Set Stack Pointer to 255
  global.registers.PC = 512;  // Set Program Counter to 512
  global.registers.flags = 0; // Set the zero flag to true

  analyzeProgram(lines);
  printProcessorStatus(global.registers);
  console.log(lines);
} catch (err) {
  console.error(err);
}
