# Lab103.py - Escritura de archivos

# Modo "a" - append: agrega contenido sin borrar lo existente
with open("archivo_demo.txt", "a") as f:
    f.write("¡Ahora el archivo tiene más contenido!")

# Leer el archivo después de agregar contenido
with open("archivo_demo.txt") as f:
    print(f.read())

# Modo "w" - write: sobrescribe el contenido existente
with open("archivo_demo.txt", "w") as f:
    f.write("¡Ups! ¡He borrado el contenido!")

# Leer el archivo después de sobrescribirlo
with open("archivo_demo.txt") as f:
    print(f.read())
