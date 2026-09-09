# Lab107.py - Clase abstracta FuncionMatematica con polimorfismo

from abc import ABC, abstractmethod
import math


class FuncionMatematica(ABC):
    @abstractmethod
    def evaluar(self, x):
        pass


class FuncionLineal(FuncionMatematica):
    def __init__(self, m, b):
        self.m = m
        self.b = b

    def evaluar(self, x):
        return self.m * x + self.b


class FuncionCuadratica(FuncionMatematica):
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def evaluar(self, x):
        return self.a * x**2 + self.b * x + self.c


class FuncionExponencial(FuncionMatematica):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def evaluar(self, x):
        return self.a * math.e ** (self.b * x)


# Lista de funciones - polimorfismo
funciones = [
    FuncionLineal(2, 3),          # f(x) = 2x + 3
    FuncionCuadratica(1, -2, 1),  # f(x) = x^2 - 2x + 1
    FuncionExponencial(1, 0.5)    # f(x) = e^(0.5x)
]

x = float(input("Ingrese el valor de x: "))

for funcion in funciones:
    print(f"{funcion.__class__.__name__}: f({x}) = {funcion.evaluar(x):.4f}")
