const fs = require('fs');

inventory = ['sword'];
visitedChambers = [];

function info(){
	return "THRILL game - a paragraph adventure/RPG game";
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

function checkInventory(item){
	console.log(`Checking presence of ${item} in the directory.`);
	const included = inventory.includes(item);
	return included;
}

function removeFromInventory(item){
	if (inventory.includes(item)) {
		const index = inventory.indexOf(item);
		inventory.splice(index, 1);
		console.log(`Item ${item} removed from inventory.`);
		return true;
	} else {
		console.log(`No element ${item} in the directory.`);
		return false;
	}
}

function markChamberVisited(id){
	if(visitedChambers.includes(id)){
		console.log(`You have already been in chamber ${id}`);
	}
	else 
		visitedChambers.push(id);
}

function getVisited(){
	return visitedChambers;
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
	addToInventory,
	checkInventory,
	removeFromInventory,
	markChamberVisited,
	getVisited
};
