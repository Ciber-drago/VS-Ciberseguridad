# Lab101.py - Abrir y leer un archivo

# Forma 1: usando with (no hay que cerrar manualmente)
with open("archivo_demo.txt", "r", encoding="utf-8") as f:
    print(f.read())
    f.close()

# Forma 2: abriendo y cerrando manualmente
f = open("archivo_demo.txt", encoding="utf-8")
print(f.readline())
f.close()
