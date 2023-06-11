function animatePong(board) {

    let pos = 0;
    const id = setInterval(frame, 5);

    function frame() {
        if (pos === board.sizeX) {
            clearInterval(id);
        } else {
            board.moveBall(true);
            pos += board.ball.velocity.speed;
            drawBall(board.ball);
        }
    }

    function drawBall(ball) {
        const ballSymbol = document.getElementById("ball");
        ballSymbol.style.top = ball.x + 'px';
        ballSymbol.style.left = ball.y + 'px';
    }
}

function drawBoard(board) {
    const boardSymbol = document.getElementById("board");
    boardSymbol.style.width = board.sizeX;
    boardSymbol.style.height = board.sizeY;
}
