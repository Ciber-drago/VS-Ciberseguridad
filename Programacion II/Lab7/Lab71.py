n = int(input("Ingresa un número para calcular su factorial: "))

f = 1
for i in range(1, n + 1):
    f *= i

print(f"El factorial de {n} es: {f}")