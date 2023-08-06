import numpy as np

board_size = 20

game_board = np.full((board_size, board_size), ' ', dtype=str)

players = ['X', 'O']
current_player = 0

def check_win(player):
    for row in range(board_size):
        for col in range(board_size):
            # Check horizontal
            if col + 2 < board_size and all(game_board[row, col:col+3] == player):
                game_board[row, col:col+3] = '.'
                return True
            # Check vertical
            if row + 2 < board_size and all(game_board[row:row+3, col] == player):
                game_board[row:row+3, col] = '.'
                return True
            # Check diagonal (top-left to bottom-right)
            if row + 2 < board_size and col + 2 < board_size and all(game_board[row+i, col+i] == player for i in range(3)):
                for i in range(3):
                    game_board[row+i, col+i] = '.'
                return True
            # Check diagonal (top-right to bottom-left)
            if row + 2 < board_size and col - 2 >= 0 and all(game_board[row+i, col-i] == player for i in range(3)):
                for i in range(3):
                    game_board[row+i, col-i] = '.'
                return True
    return False

def display_board():
    for row in game_board:
        print(' | '.join(row))
        print('-' * (board_size * 4 - 1))

def get_input():
    while True:
        try:
            row = int(input(f"Player {players[current_player]}, enter row (0-{board_size-1}): "))
            col = int(input(f"Player {players[current_player]}, enter column (0-{board_size-1}): "))
            if 0 <= row < board_size and 0 <= col < board_size and game_board[row, col] == ' ':
                return row, col
            print("Invalid input or field already taken. Try again.")
        except ValueError:
            print("Invalid input. Please enter valid row and column.")

def switch_player():
    global current_player
    current_player = (current_player + 1) % 2

def main():
    print("starting game...")
    turns = board_size * board_size

    while turns > 0:
        display_board()
        row, col = get_input()
        game_board[row, col] = players[current_player]
        if check_win(players[current_player]):
            print(f"Player {players[current_player]} scored a point!")
        switch_player()
        turns -= 1

if __name__ == "__main__":
    main()


