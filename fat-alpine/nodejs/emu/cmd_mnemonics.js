function loadx(value){
	console.log(`Execute ldx ${value}...`);	
	if (value >= 0 && value < 256){
		global.registers.XR = value;
		global.registers.PC += 2;
	}
	else{
		console.log('Wrong value');
		global.registers.flags.error = true;
	}
}

function loady(value){
	console.log(`Execute ldy ${value}...`);	
	if (value >= 0 && value < 256){
		global.registers.YR = value;
		global.registers.PC += 2;
	}
	else{
		console.log('Wrong value');
		global.registers.flags.error = true;
	}
}

function addx(value){
	if (value > 255){
		console.log('Wrong value');
		global.registers.flags.error = true;
		return;
	}
	
	else if (global.registers.XR + value > 255){
		global.registers.flags.overflow = true;
		console.log('overflow - command executed, but value truncated with modulo');
	}
	
	global.registers.XR = (global.registers.XR + value) % 255;
	global.registers.PC += 2;
	checkZero(global.registers.XR);
}

function addy(value){
	if (value > 255 || value < 0){
		console.log('Wrong value');
		global.registers.flags.error = true;
		return;
	}
	
	if (global.registers.YR + value > 255){
		global.registers.flags.overflow = true;
		console.log('overflow - command executed, but value truncated with modulo');
	}
	
	global.registers.YR = (global.registers.YR + value) % 255;
	global.registers.PC += 2;
	checkZero(global.registers.YR);	
}

function subx(value){
	if (value > 255){
		console.log('Wrong value');
		global.registers.flags.error = true;
		return;
	}
	
	else if (global.registers.XR - value < 255){
		global.registers.flags.zero = true;
		console.log('overflow - command executed, but value truncated with modulo');
	}
	
	global.registers.XR = (global.registers.XR - value) % 255;
	global.registers.PC += 2;
	checkZero(global.registers.XR);
}

function suby(value){
	if (value > 255 || value < 0){
		console.log('Wrong value');
		global.registers.flags.error = true;
		return;
	}
	
	if (global.registers.YR + value > 255){
		global.registers.flags.overflow = true;
		console.log('overflow - command executed, but value truncated with modulo');
	}
	
	global.registers.YR = (global.registers.YR + value) % 255;
	global.registers.PC += 2;
	checkZero(global.registers.YR);	
}

function checkZero(val){
	if (val === 0){
		console.log('Result = 0. Marking the flag.');
		global.registers.flags.zero = true;
	}
}

function clearFlag(flag){

	global.registers.PC += 2;
	
	if (flag.toLowerCase() === 'c')
		global.registers.flags.carry = false;
	else if (flag.toLowerCase() === 'z')
		global.registers.flags.zero = false;
	else if (flag.toLowerCase() === 'o')
		global.registers.flags.overflow = false;
	else if (flag.toLowerCase() === 'n')
		global.registers.flags.negative = false;
	else if (flag.toLowerCase() === 'e')
		global.registers.flags.error = false;
	else if (flag.toLowerCase() === 'all'){
		global.registers.flags.carry = false;
		global.registers.flags.zero = false;
		global.registers.flags.overflow = false;
		global.registers.flags.negative = false;
		global.registers.flags.error = false;
		global.registers.PC += 8;
	}
	else {
		console.log('Wrong flag name, avaialble are: c, z, o, n, e, all');
		global.registers.PC -= 2;
	}
}

function nop(){
	console.log('doing nothing');
	global.registers.PC += 2;
}

function inc(register){
	if (register.toLowerCase() === 'x')
		addx(1);
	else addy(1);
	global.registers.PC --; //takes one cycle
}

function dec(register){
	if (register.toLowerCase() === 'x')
		subx(1);
	else suby(1);
	global.registers.PC --; //takes one cycle
}

module.exports = {
  loadx,
  loady,
  addx,
  addy,
  subx,
  suby,
  nop,
  inc,
  dec,
  clearFlag
};
