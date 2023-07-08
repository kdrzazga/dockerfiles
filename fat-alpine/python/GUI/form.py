import tkinter as tk

# Create the main application window
window = tk.Tk()
window.title("Data Form")
window.geometry("400x300")

# Function to handle button click event
def save_data():
    name = name_entry.get()
    email = email_entry.get()
    age = age_entry.get()

    # Save the data or perform any desired actions
    print(f"Name: {name}")
    print(f"Email: {email}")
    print(f"Age: {age}")

    # Clear the textboxes
    name_entry.delete(0, tk.END)
    email_entry.delete(0, tk.END)
    age_entry.delete(0, tk.END)

# Create a label and textbox for Name
name_label = tk.Label(window, text="Name:")
name_label.pack()
name_entry = tk.Entry(window)
name_entry.pack()

# Create a label and textbox for Email
email_label = tk.Label(window, text="Email:")
email_label.pack()
email_entry = tk.Entry(window)
email_entry.pack()

# Create a label and textbox for Age
age_label = tk.Label(window, text="Age:")
age_label.pack()
age_entry = tk.Entry(window)
age_entry.pack()

# Create a button to save the data
save_button = tk.Button(window, text="Save", command=save_data)
save_button.pack(pady=10)

# Start the application
window.mainloop()
