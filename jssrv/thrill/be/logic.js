const fs = require('fs');

function info(){
	return "THRILL game - a paraghraph adventure/RPG game";
}

function start(){
	return readDataFile('intro');
}

function readParagraph(paragraphId){
	return readDataFile(paragraphId);
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
	readParagraph
};
