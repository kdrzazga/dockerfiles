let board = [];
let history = [];
let sizeX = 0;
let sizeY = 0;

function info(){
	return "Board Clicker. When you click a given tile, all adjancent tiles get their number increased by one. The one you click does not.";
}

function createBoard(maxX, maxY){
	board = new Array(maxX);
	
	for(let x = 0; x < maxX; x++){
		board[x] = new Array(maxY);
		
		for(let y = 0; y < maxY; y++){
			board[x][y] = 0;
		}
	}
	
	sizeX = maxX;
	sizeY = maxY;	
	return board;
}

function click(x, y){
	
	let success = withinBoard(x, y);
	var entry = `[${x}, ${y}] ${success} BOARD[${sizeX},${sizeY}]: ${board}`;	
	if (!success) return;
	
	let neighbors = findAdjacentCells(x, y);
	neighbors.forEach(function(cell) {
		var x = cell[0];
		var y = cell[1];
		board[x][y]++;
	});
	history.push(entry);
}

function getHistory(){
	return history;
}

function getBoard(){
	return board;
}

function findAdjacentCells(x, y){
	var cells1 = [
		[x-1,y-1], [x,y-1], [x+1,y-1],
		[x-1,y], [x+1,y],
		[x-1,y+1], [x,y+1], [x+1,y+1] 
		];
	
	return cells1.filter(function(cell) {
	var x = cell[0];
	var y = cell[1];
	return withinBoard(x, y);
	});
}

function withinBoard(x, y){
	return x >= 0 && x < sizeX && y >=0 && y < sizeY;
}

module.exports={
	info,
	click,
	createBoard,
	getBoard,
	getHistory
};
