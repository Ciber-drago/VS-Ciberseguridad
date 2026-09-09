n = int(input("Ingresa el orden N (número par) para la matriz identidad: "))

while n % 2 != 0 or n <= 0:
    print("El número debe ser par y positivo.")
    n = int(input("Ingresa el orden N (número par): "))

matriz = []
for i in range(n):
    fila = []
    for j in range(n):
        if i == j:
            fila.append(1)
        else:
            fila.append(0)
    matriz.append(fila)

print(f"\nMatriz identidad de orden {n}:")
for fila in matriz:
    print(fila)