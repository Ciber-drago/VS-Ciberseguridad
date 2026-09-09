class Usuario:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    @classmethod
    def crear_anonimo(cls):
        # 'cls' es equivalente a usar 'Usuario'
        return cls("Anónimo", 0)

    def __str__(self):
        return f"Usuario: {self.nombre}, Edad: {self.edad}"

# Uso del constructor alternativo
invitado = Usuario.crear_anonimo()
print(invitado)  # Usuario: Anónimo, Edad: 0
