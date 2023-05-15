const fs = require('fs');

lines =[];

const registers = {
  A: 0,       // Accumulator (8-bit)
  X: 0,       // X Register (8-bit)
  Y: 0,       // Y Register (8-bit)
  SP: 0,      // Stack Pointer (8-bit)
  PC: 0,      // Program Counter (16-bit)
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

fs.readFile('program.ass', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  // Split the file contents by lines
  lines = data.split('\n');
});


// Accessing and modifying the registers
registers.A = 42;            // Set A register to 42
registers.X = 10;            // Set X register to 10
registers.SP = 255;          // Set Stack Pointer to 255
registers.PC = 512;          // Set Program Counter to 512
registers.flags.zero = true; // Set the zero flag to true


function printProcessorStatus(registers) {
  const divider = '+-----------------------------------------+';
  const line = '|PC     | ACC | X   | Y   | FLAGS              |';
  const values = `|${registers.PC} | ${registers.ACC}  | ${registers.X}  | ${registers.Y}  | ${registers.FLAGS}            |`;

  console.log(divider);
  console.log(line);
  console.log(divider);
  console.log(values);
  console.log(divider);
}


printProcessorStatus(registers);
console.log(lines);