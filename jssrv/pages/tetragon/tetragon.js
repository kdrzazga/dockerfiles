const SIDE = {
    RED: 'red',
    BLUE: 'blue'
};

let redSelectionColor = 'darkred';
let blueSelectionColor = 'darkblue';
let backgroundColor = 'khaki';
let currentTurn = SIDE.BLUE;
let selectedCellId = null;
let boardTable;

function init(sizeX, sizeY) {
    boardTable = document.getElementById("board");
    createBoard();
    placeStartingTiles();

    function placeStartingTiles() {
        ["1,1", "1,2", "2,1"].forEach(id => setBackground(id, SIDE.RED));

        ["20,1", "20,2", "19,1"].forEach(id => setBackground(id, SIDE.BLUE));
    }

    function createBoard() {
        for (let x = 0; x < sizeX; x++) {
            let row = boardTable.insertRow(x);
            for (let y = 0; y < sizeY; y++) {
                let cell = row.insertCell(y);
                cell.innerText = " ";
                cell.id = x + "," + y;
                cell.style.backgroundColor = backgroundColor;
                cell.addEventListener('click', onCellClick, false);
            }
        }
    }
}

function onCellClick(square) {
    let clickedCellId = square.target.id;

    if (getBackground(clickedCellId) === backgroundColor) {
        setBackground(clickedCellId, currentTurn);
        nextTurn();

    } else if (getBackground(clickedCellId) === currentTurn) {
        selectCell(clickedCellId);
    }
}

function setBackground(id, color) {
    let cell = document.getElementById(id);
    cell.style.backgroundColor = color;
}

function getBackground(id) {
    let cell = document.getElementById(id);
    return cell.style.backgroundColor;
}

function clearSelectedCell() {
    if (selectedCellId != null) {

        if (getBackground(selectedCellId) === redSelectionColor) {
            setBackground(selectedCellId, SIDE.RED);
        } else {
            setBackground(selectedCellId, SIDE.BLUE);
        }
        selectedCellId = null;
    }
}

function selectCell(id) {
    clearSelectedCell();
    selectedCellId = id;
    setBackground(selectedCellId, getSelectionColor(currentTurn));
}

function getSelectionColor(side) {
    if (side === SIDE.BLUE)
        return blueSelectionColor;
    else return redSelectionColor;
}

function nextTurn() {
    if (currentTurn === SIDE.BLUE) {
        currentTurn = SIDE.RED;
    } else {
        currentTurn = SIDE.BLUE;
    }
}

function distance(cell1Id, cell2Id){
    const x1 = cell1Id.split(",")[0];
    const y1 = cell1Id.split(",")[1];
    const x2 = cell2Id.split(",")[0];
    const y2 = cell2Id.split(",")[1];
}
