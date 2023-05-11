package main

import (
	"fmt"
	"strings"
	"time"
)

func main() {
	text := "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac commodo velit. Mauris id purus quis turpis luctus viverra."

	// Adjust the scroll speed by modifying the sleep duration
	sleepDuration := 100 * time.Millisecond

	for {
		clearScreen()
		fmt.Print(scrollText(text))
		time.Sleep(sleepDuration)
	}
}

func scrollText(text string) string {
	// Shift the text by one character to the left
	text = text[1:] + string(text[0])
	return text
}

func clearScreen() {
	fmt.Print("\033[H\033[2J")
}
