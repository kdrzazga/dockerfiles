def yielding():
    yield "one"
    yield "two"
    yield "three"
    yield "four"


print("1. ZIP example")

countries = ["Poland", "Chad", "Ethiopia"]
capitals = ["Warsaw", "Njamena", "Adis Adeba"]

for key, val in zip(countries, capitals):
    print(key + ", " + val)

print("2. yield")
for val in yielding():
    print(val)

print("3. enumerate")

for index, country in enumerate(countries):
    print(str(index) + " " + country)
    
input("Press any key to exit...")
