const WIDTH = 10;
const HEIGHT = 10;
let mast = '-mast';
const HORIZONTAL = 'horizontal';
const VERTICAL = 'vertical';
const RESERVED = 'r';

function getRandomDirection() {
  return Math.random() < 0.5 ? HORIZONTAL : VERTICAL;
}

function getRandomPoint(board) {
  let x, y;
  do {
    x = Math.floor(Math.random() * WIDTH);
    y = Math.floor(Math.random() * HEIGHT);
  } while (board[x][y] !== '');

  return { x, y };
}

function isWithinBoard(point) {
  return point.x >= 0 && point.x < WIDTH && point.y >= 0 && point.y < HEIGHT;
}

function placeShip(board, shipLength) {
  const shipFields = [];
  mast = shipLength + mast;
  const direction = getRandomDirection();
  let startPoint = getRandomPoint(board);

	while (true) {
		if (isWithinBoard(startPoint)) {
		let validPlacement = true;
	
		for (let i = 0; i < shipLength; i++) {
			const x = direction === HORIZONTAL ? startPoint.x + i : startPoint.x;
			const y = direction === VERTICAL ? startPoint.y + i : startPoint.y;
	
			if (!isWithinBoard({ x, y }) || board[x][y] !== '') {
			validPlacement = false;
			break;
			}
		}
	
		// If a valid placement is found, mark the points on the board
		if (validPlacement) {
			for (let i = 0; i < shipLength; i++) {
			const x = direction === HORIZONTAL ? startPoint.x + i : startPoint.x;
			const y = direction === VERTICAL ? startPoint.y + i : startPoint.y;
			board[x][y] = mast;
			shipFields.push({x, y});
			}
			break;
		}
		}
	
		startPoint = direction === HORIZONTAL ? { x: startPoint.x, y: startPoint.y + 1 } : { x: startPoint.x + 1, y: startPoint.y };
		if (startPoint.x >= WIDTH || startPoint.y >= HEIGHT) {
		startPoint = getRandomPoint(board);
		}
	}
  
   console.log('Fields of generated ship: ' + JSON.stringify(shipFields));
  
}

function reserveTile(x, y, board){
	if (isWithinBoard({ x, y})){
		if (board[x][y] == ''){
			board[x][y] = RESERVED;
		}
	}
}

function reserveAdjacentTiles(board){
	for (let x = 0; x < WIDTH; x++){
		for (let y = 0; y < HEIGHT; y++){
			
				if (board[x][y].endsWith('-mast')) {
				
					[{i: x - 1, j: y - 1}, {i: x, j: y - 1}, {i: x + 1, j: y - 1},
					{i: x - 1, j: y}, {i: x + 1, j: y},			
					{i: x - 1, j: y + 1}, {i: x, j: y + 1}, {i: x + 1, j: y + 1}
					].forEach(function(point) {
						reserveTile(point.i, point.j, board);
					});
			}
		}
	}
}

function drawBoard(board) {
  for (let y = 0; y < HEIGHT; y++) {
    let row = '';
    for (let x = 0; x < WIDTH; x++) {
      if (board[x][y] === '') {
        row += '.';
      } else if (board[x][y].endsWith('-mast')){
		row += 'S';
      } else {
        row += board[x][y];
      }
      row += ' ';
    }
    console.log(row.trim());
  }
}

console.log('This program generates a board for BATTLE SHIPS game. ');

const board = Array.from({ length: WIDTH }, () => Array(HEIGHT).fill('')); // Create a WIDTHxHEIGHT board
const shipLength = 4;
placeShip(board, shipLength);
reserveAdjacentTiles(board);
drawBoard(board);
