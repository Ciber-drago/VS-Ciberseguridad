x = 5
y = "juan"
print(x)
print(y)

x = str(3)
y = int(3)
z = float(3)
print(type(x))
print(type(y))
print(type(z))

x = "Hola"
#es lo mismo que
x = 'Hola'

a = 4
A = "Cuatro"
#A y a son variables diferentes, Python es sensible a mayúsculas y minúsculas

x, y, z = "naranja", "pera", "fresa"
print(x)
print(y)
print(z)

x = y = z = "naranja"
print(x)
print(y)
print(z)

fruits = ["manzana", "uva", "mandarina"]
x, y, z = fruits
print(x)
print(y) 
print(z)

x = "Python"
y = "es"
z = "facil de aprender"
print(x, y, z)
x = "Python "
y = "es "
z = "amigable"
print(x + y + z)
x = 5
y = 10
print(x + y)