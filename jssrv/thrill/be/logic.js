const fs = require('fs');

function info(){
	return "info";
}

function start(){
	return readDataFile('intro');	
}

function readParagraph(paragraphId){
	return readDataFile(paragraphId);
}

function readDataFile(filename){
	fs.readFile('paragraphs/' + filename + '.txt', 'utf8', (err, data) => {
		if (err) throw err;
		else console.log(`Read ${filename}`);
	
		return data;
	});
}

module.exports={
	info,
	start
};
