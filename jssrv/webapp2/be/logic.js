let board = [];
let history = [];

function info(){
	return "Board Clicker";
}

function createBoard(sizeX, sizeY){
	board = new Array(sizeX);
	
	for(let x = 0; x < sizeX; x++){
		board[x] = new Array(sizeY);
		
		for(let y = 0; y < sizeY; y++){
			board[x][y] = 0;
		}
	}
	
	return board;
}

function click(x, y){
	
	let success = false;
	entry = `[${x}, ${y}] ${success} BOARD: ${board}`;
	history.push(entry);
}

function getHistory(){
	return history;
}

function getBoard(){
	return board;
}

module.exports={
	info,
	click,
	createBoard,
	getBoard,
	getHistory
};
