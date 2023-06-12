let board;

function init() {
    board = new Board(400, 900);

    document.addEventListener("keypress", function (event) {

        switch (event.code) {
            case "a".charCodeAt(0):
                alert("left up");
                break;

            case "z".charCodeAt(0):
                alert("left down");
                break;

            case "p".charCodeAt(0):
                alert("right up");
                break;

            case "l".charCodeAt(0):
                alert("right down");
                break;
        }
    });

    drawBoard(board);
    animatePong(board);
}
