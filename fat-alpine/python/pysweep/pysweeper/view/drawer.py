from pysweeper.model.board import Board


def analyze_board(b: Board) -> list:
    drawable_board = []
    for y in range(b.height):
        row = ['.'] * b.width
        drawable_board.append(row)

    for mine in b.mines:
        print(str(mine.get_x()) + ", " + str(mine.get_y()))
        drawable_board[mine.get_x()][mine.get_y()] = 'm'

    return drawable_board


def text_draw(b: Board):
    for row in analyze_board(b):
        print(row)


if __name__ == '__main__':
    text_draw(Board(10, 11, 15))
