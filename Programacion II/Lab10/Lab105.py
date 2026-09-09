# Lab105.py - Calcular factorial de un número N

class Factorial:
    def __init__(self, n):
        self.n = n

    def calcular(self):
        resultado = 1
        for i in range(1, self.n + 1):
            resultado *= i
        return resultado


n = int(input("Ingrese un número para calcular su factorial: "))
obj = Factorial(n)
print(f"El factorial de {n} es: {obj.calcular()}")
