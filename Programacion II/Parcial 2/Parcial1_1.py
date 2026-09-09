class Operador:
    def __init__(self, x):
        self.x = x

    def modificar(self, a):
        return a + 5

    def operar(self):
        self.x = self.modificar(self.x)
        return self.x * 2


class OperadorAvanzado(Operador):
    def modificar(self, a):
        return a + 10

    def operar(self):
        self.x = self.modificar(self.x)
        return self.x * 3
# Uso de las clases
op_basico = Operador(10)
print("Operador básico:", op_basico.operar())  # Usa lógica original
print("Valor interno básico:", op_basico.x)

op_avanzado = OperadorAvanzado(10)
print("Operador avanzado:", op_avanzado.operar())  # Usa lógica sobrescrita
print("Valor interno avanzado:", op_avanzado.x)
