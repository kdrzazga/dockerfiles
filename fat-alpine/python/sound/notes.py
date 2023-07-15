import pygame
import time
import numpy as np

pygame.init()
pygame.mixer.init()

def play_note(frequency, duration, volume=0.5):
    sample_rate = 44100  # Sample rate in Hz
    sample_duration = duration / 1000  # Duration of the note in seconds

    # Generate a square wave for the specified frequency and duration
    t = np.linspace(0, sample_duration, int(sample_rate * sample_duration), endpoint=False)
    waveform = np.sin(2 * np.pi * frequency * t)
    square_wave = np.where(waveform >= 0, 1, -1)

    # Scale the waveform based on the desired volume
    scaled_waveform = (square_wave * volume * 32767).astype(np.int16)

    # Convert the waveform to a byte stream
    byte_stream = scaled_waveform.tobytes()

    # Create a Sound object from the byte stream
    sound = pygame.mixer.Sound(byte_stream)

    # Play the note
    sound.play()
    time.sleep(sample_duration)
    sound.stop()

note_frequency = 440  # Frequency of the note in Hz (A4 note)
note_duration = 2500  # Duration of the note in milliseconds
note_volume = 0.5     # Volume level (0.0 to 1.0)
play_note(note_frequency, note_duration, note_volume)

pygame.quit()
