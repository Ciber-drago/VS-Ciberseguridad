# Punto 4
# Para convertir libras a kilogramos se utiliza la relación:
# 1 kg = 2.20462 lb
# Fórmula:
# kg = libras / 2.20462
# El programa solicita las libras, realiza la conversión
# y muestra el resultado en kilogramos.

#Punto 5 el programa:
class ConversorPeso:
    def __init__(self, libras):
        self.libras = libras

    def convertir(self):
        return self.libras / 2.20462


libras = float(input("Ingrese las libras: "))
c = ConversorPeso(libras)

print("Kilogramos:", c.convertir())