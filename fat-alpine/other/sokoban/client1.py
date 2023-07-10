import requests

base_url = "http://localhost:8080"

# Helper function to send authenticated requests
def send_request(url, method, data=None):
    response = requests.request(
        method,
        url,
        json=data,
        auth=("player1", "pass1")
    )
    return response

# Start the game
def start_game():
    url = f"{base_url}/start-game"
    response = send_request(url, "POST")
    # Handle the response

# Get the game status
def get_game_status():
    url = f"{base_url}/game-status"
    response = send_request(url, "GET")
    # Handle the response

# Get the game board
def get_board():
    url = f"{base_url}/board"
    response = send_request(url, "GET")
    # Handle the response

# Move the player up
def move_up():
    url = f"{base_url}/move/up"
    response = send_request(url, "POST")
    # Handle the response

# Move the player down
def move_down():
    url = f"{base_url}/move/down"
    response = send_request(url, "POST")
    # Handle the response

# Move the player left
def move_left():
    url = f"{base_url}/move/left"
    response = send_request(url, "POST")
    # Handle the response

# Move the player right
def move_right():
    url = f"{base_url}/move/right"
    response = send_request(url, "POST")
    # Handle the response

# Usage example
start_game()
get_game_status()
get_board()
move_up()
move_down()
move_left()
move_right()
