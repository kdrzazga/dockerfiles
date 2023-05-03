#!/usr/bin/perl

# Initialize the game board
my @board = (' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');

# Define the players
my $player1 = 'X';
my $player2 = 'O';

# Define the current player and set it to player 1
my $current_player = $player1;

# Define the game loop
while (1) {
    # Print the current state of the board
    print_board();

    # Ask the current player to make a move
    my $move = get_move();

    # Update the board with the current player's move
    $board[$move] = $current_player;

    # Check if the game has been won or tied
    if (check_win() || check_tie()) {
        # Print the final state of the board
        print_board();

        # Print the result of the game
        if (check_win()) {
            print "Player $current_player wins!\n";
        } else {
            print "The game is a tie!\n";
        }

        # Exit the game loop
        last;
    }

    # Switch to the other player
    if ($current_player eq $player1) {
        $current_player = $player2;
    } else {
        $current_player = $player1;
    }
}

# Subroutine to print the current state of the board
sub print_board {
    print "\n";
    print " $board[0] | $board[1] | $board[2] \n";
    print "---+---+---\n";
    print " $board[3] | $board[4] | $board[5] \n";
    print "---+---+---\n";
    print " $board[6] | $board[7] | $board[8] \n";
    print "\n";
}

# Subroutine to get the current player's move
sub get_move {
    my $move;

    while (1) {
        print "Player $current_player, please enter your move (0-8): ";
        $move = <STDIN>;
        chomp($move);

        if ($move =~ /^[0-8]$/ && $board[$move] eq ' ') {
            last;
        } else {
            print "Invalid move, please try again.\n";
        }
    }

    return $move;
}

# Subroutine to check if the game has been won
sub check_win {
    if ($board[0] eq $current_player && $board[1] eq $current_player && $board[2] eq $current_player) {
        return 1;
    } elsif ($board[3] eq $current_player && $board[4] eq $current_player && $board[5] eq $current_player) {
        return 1;
    } elsif ($board[6] eq $current_player && $board[7] eq $current_player && $board[8] eq $current_player) {
        return 1;
    } elsif ($board[0] eq $current_player && $board[3] eq $current_player && $board[6] eq $current_player) {
        return 1;
    } elsif ($board[1] eq $current_player && $board[4] eq $current_player && $board[7] eq $current_player) {
        return 1;
    } elsif ($board[2] eq $current_player && $board[5] eq $current_player && $board[
