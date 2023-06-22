const fs = require('fs');

global.inventory = ['sword'];

function info(){
	return "THRILL game - a paraghraph adventure/RPG game";
}

function start(){
	return readDataFile('intro');
}

function readParagraph(paragraphId){
	return readDataFile(paragraphId);
}

function readInventory(){
	return inventory;
}

function addToInventory(item){
	if (!inventory.includes(item)){
		inventory.push(item);
		console.log(`Added "${item}" to the inventory.`);
		return true;
	}
	else {
		console.log(`Item "${item}" already is in the inventroy`);
		return false;
	}
}

function readDataFile(filename) {
  try {
    const data = fs.readFileSync('paragraphs/' + filename + '.txt', 'utf8');
    console.log(`Read ${filename}`);
    return data;
  } catch (err) {
    console.error(err);
    return '';
  }
}

module.exports={
	info,
	start,
	readParagraph,
	readInventory,
	addToInventory
};
