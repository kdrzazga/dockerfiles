import tkinter as tk

# Create the main window
root = tk.Tk()

# Set the size of the main window
root.geometry("600x400")  # Adjust the size as needed

# Create the frames
frame1 = tk.Frame(root, bg="red")
frame2 = tk.Frame(root, bg="green")
frame3 = tk.Frame(root, bg="blue")

# Configure the grid layout
root.grid_rowconfigure(0, weight=3)
root.grid_rowconfigure(1, weight=1)
root.grid_columnconfigure(0, weight=3)
root.grid_columnconfigure(1, weight=1)

# Place the frames on the grid
frame1.grid(row=0, column=0, columnspan sticky="nsew")
frame2.grid(row=1, column=0, sticky="nsew")
frame3.grid(row=1, column=1, sticky="nsew")

# Run the main window loop
root.mainloop()
