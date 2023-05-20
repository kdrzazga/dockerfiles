#!/usr/bin/env node

import chalk from 'chalk';
import inquirer from 'inquirer';
import gradient from 'gradient-string';
import chalkAnimation from 'chalk-animation';
import figlet from 'figlet';
import { createSpinner } from 'nanospinner';

console.log(chalk.bgGreen('hi CHALK !'));


let playerName;
const sleep = (ms = 5000) => new Promise((r) => setTimeout(r, ms));

async function welcome(){
	const rainbowTitle = chalkAnimation.rainbow(
		'This colorful animation will be displayed for 5 seconds\n'
	);

	await sleep();
	rainbowTitle.stop();

	console.log(`
Done!
The animation has just been ${chalk.bgRed('stopped')}
	`);
}

await welcome()

