import tkinter as tk
from math import sin, pi

window = tk.Tk()
window.title("Sine Curve")
window.geometry("600x400")
canvas = tk.Canvas(window, width=500, height=300)
canvas.pack()

# Function to draw the sine curve on the canvas
def draw_sine():
    amplitude = 650
    frequency = 2  
    period = 2 * pi / frequency
    x_scale = 0.1
    y_scale = 0.1

    canvas.delete("all")
    canvas.create_line(20, 150, 480, 150, width=2)  # x-axis
    canvas.create_line(250, 20, 250, 280, width=2)  # y-axis
    
    for x in range(0, 500):
        y = amplitude * sin((x * x_scale) * frequency)
        canvas.create_oval(x, 150 - y * y_scale, x + 1, 150 - y * y_scale + 1, fill="black")
        
button = tk.Button(window, text="Draw Sine Curve", command=draw_sine)
button.pack(pady=10)

window.mainloop()
