const WIDTH = 10;
const HEIGHT = 10;
const FOUR_MAST = '4-mast'

function getRandomDirection(){
	return Math.random() < 0.5 ? 'horizontal': 'vertical';
}

function getRandomPoint(board){
	let x, y;
	do {
		x = Math.floor(Math.random()) * WIDTH);
		y = Math.floor(Math.random()) * HEIGHT);
	} while (board[x][y] !== '');

	return {x, y};
}

function isWithinBoard(point) {
	return point.x >= 0 && point.y < WIDTH && point.y >= 0 && point.y < HEIGHT;
}

function placeFourMastShip(board){
	const direction = getRandomDirection();
	let startPoint = getRandomPoint();
	
	while (true) {
		if(isWithinBoard(startPoint)){
			let validPlacement = true;
			
			for(let i = 0; i < 4; i++){
				const x = direction === 'horizontal' ? startPoint.x + i : startPoint.x;
				const y = direction === 'vertical' ? startPoint.y + i : startPoint.y;
				
				if (!isWithinBoard({ x,y }) || board[x][y] !== ''){
					validPlacement = false;
					break;
				}
				
			}
			
			// If a valid placement is found, mark the points on the board
			if (validPlacement) {
				for(let i = 0; i < 4; i++){
					          const x = direction === 'horizontal' ? startPoint.x + i : startPoint.x;
          const y = direction === 'vertical' ? startPoint.y + i : startPoint.y;
          board[x][y] = FOUR_MAST;
				}
				break;
			}				
		}
		
		startPoint = direction === 'horizontal' ? { x: startPoint.x, y: startPoint.y + 1 } : { x: startPoint.x + 1, y: startPoint.y };
    if (startPoint.x >= WIDTH || startPoint.y >= HEIGHT) {
      startPoint = getRandomPoint();
    }
	}
	
}

const board = Array.from({ length: WIDTH }, () => Array(HEIGHT).fill('')); // Create a WIDTHxHEIGHT board
placeFourMastShip(board);
console.log(board);
