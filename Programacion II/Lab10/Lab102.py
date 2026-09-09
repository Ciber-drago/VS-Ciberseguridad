# Lab102.py - Líneas de lectura y recorrer todo el archivo

# Leer línea por línea con readline()
with open("archivo_demo.txt") as f:
    print(f.readline())
    print(f.readline())

# Recorrer todo el archivo con un bucle
with open("archivo_demo.txt") as f:
    for x in f:
        print(x)
