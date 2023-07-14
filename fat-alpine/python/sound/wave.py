import pygame
import time

pygame.init()
pygame.mixer.init()

def play_sound(file_path, duration):
    pygame.mixer.music.load(file_path)
    pygame.mixer.music.play()
    time.sleep(duration)
    pygame.mixer.music.stop()

# Play a sound file
sound_file_path = "monty_pythons_meaning_bucket.wav"
sound_duration = 2  # in seconds
play_sound(sound_file_path, sound_duration)

pygame.quit()
