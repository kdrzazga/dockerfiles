let origBoard;
const humanPlayer = '0';
const aiPlayer = 'X';
const winCombos = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
];

const cells = document.querySelectorAll('.cell');

startGame();

function startGame() {
    document.querySelector(".endgame").style.display = "none";
    origBoard = Array.from(Array(9).keys());

    for (let i = 0; i < cells.length; i++) {
        cells[i].innerText = '';
        cells[i].style.removeProperty('background-color');
        cells[i].addEventListener('click', turnClick, false);
    }
}

function checkWin(board, player) {
    let occupiedFields = board.reduce((accumulator, element, index) =>
        (element === player) ? accumulator.concat(index) : accumulator, []);

    let gameWon = null;

    for (let [index, win] of winCombos.entries()) {
        if (win.every(elem => occupiedFields.indexOf(elem) > -1)) {
            gameWon = {index: index, player: player};
            break;
        }
    }

    return gameWon;
}

function gameOver(gameWon) {
    for (let index  of winCombos[gameWon.index]) {
        document.getElementById(index).style.backgroundColor =
            gameWon.player === humanPlayer ? "blue" : "red";
    }

    for (let i = 0; i < cells.length; i++) {
        cells[i].removeEventListener('click', turnClick, false)
    }

    declareWinner(gameWon.player === humanPlayer ? "You win!" : "You lose")
}

function turn(id, player) {
    origBoard[id] = player;
    document.getElementById(id).innerText = player;
    let gameWon = checkWin(origBoard, player);

    if (gameWon) gameOver(gameWon);
}

function emptySquares() {
    return origBoard.filter(s => typeof s == 'number');
}

function bestSpot() {
    return emptySquares()[0];
}

function declareWinner(who) {
    document.querySelector(".endgame").style.display = "block";
    document.querySelector(".endgame .text").innerText = who;
}

function checkTie() {
    if (emptySquares().length === 0) {
        for (let i = 0; i < cells.length; i++) {
            cells[i].style.backgroundColor = "green";
            cells[i].removeEventListener('click', turnClick, false);

        }

        declareWinner("Tie Game!");
        return true;
    }
    return false;
}

function turnClick(square) {
    const nobodyClickedSquare = typeof origBoard[square.target.id] == 'number';
    if (nobodyClickedSquare) {
        turn(square.target.id, humanPlayer);

        if (!checkTie()) turn(bestSpot(), aiPlayer);
    }
}
