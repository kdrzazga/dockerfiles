
function help(){
	console.log('Commnads:');
	console.log('status');
	console.log('exit');
	console.log('quit');
	console.log('load x 40');
	console.log('load y 255');
	console.log('clear c   clear z   clear all - clears flags');
	console.log('add x 20');
	console.log('sub y 10');
	console.log('inc x');
	console.log('dec y');
	console.log('help');
}

function exit(){
	console.log('Quitting the interpreter...');
    process.exit(0);
}

function status(){
	console.log('STATUS:');
	console.log('processor:');
	console.log('+---+---+---+---+-----+');
	console.log('|PC |XR |YR |SP |flags|');
	console.log('|   |   |   |   |CZONE|');
	
	const pc = String(global.registers.PC).padStart(3, ' ');
	const xr = String(global.registers.XR).padStart(3, ' ');
	const yr = String(global.registers.YR).padStart(3, ' ');
	const sp = String(global.registers.SP).padStart(3, ' ');
	const c = global.registers.flags.carry ? '1': '0';
	const z = global.registers.flags.zero ? '1': '0';
	const o = global.registers.flags.overflow ? '1': '0';
	const n = global.registers.flags.negative ? '1': '0';
	const e = global.registers.flags.error ? '1': '0';
	
	console.log('+---+---+---+---+-----+');
	console.log('|' + pc + '|'+ xr + '|' + yr +'|' + sp + '|' + c + z + o + n + e +'|');
	console.log('+---+---+---+---+-----+');
	console.log('\nmemory:');
	
	const tableSize = 50;
	console.log('+---'.repeat(tableSize) + '+');
  for (let i = 0; i <= 255; i += tableSize) {
    let row = '|';

    // Generate each cell in the row
    for (let j = 0; j < tableSize; j++) {
      const num = i + j;

      // Pad the number with spaces
      const paddedNum = String(num).padStart(3, ' ');

	  if (num >= 255) break;
      // Add the cell to the row
      row += paddedNum + '|';
    }

    // Print the row
    console.log(row);

    // Print the row separator
    console.log('+---'.repeat(tableSize) + '+');
  }
	console.log('|  |');
	console.log('+--+');
	console.log('\nstack:');

}

module.exports = {
  status,
  help,
  exit
};
