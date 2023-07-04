from tinydb import TinyDB, Query

# Create an instance of the TinyDB in-memory database
db = TinyDB("db.json")

# Insert data into the database
db.insert({'name': 'John', 'age': 25})
db.insert({'name': 'Jane', 'age': 30})

items = [
    {"name": "Cake", "quantity": 1},
    {"name": "Candles", "quantity": 10},
    {"name": "Balloons", "quantity": 50}
]
db.insert_multiple(items) 

# Query the database
User = Query()
result = db.search(User.name == 'John')
print(result)  # [{'name': 'John', 'age': 25}]

# Update a record
db.update({'age': 26}, User.name == 'John')

# Query again to see the updated record
result = db.search(User.name == 'John')
print(result)  # [{'name': 'John', 'age': 26}]

# Remove a record
db.remove(User.name == 'John')

# Query again to verify the record is removed
result = db.search(User.name == 'John')
print(result)  # []

# Close the database
db.close()
