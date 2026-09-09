class Persona:
    # Atributo estático (compartido por todas las instancias)
    contador = 0

    def __init__(self, nombre):
        self.nombre = nombre
        Persona.contador += 1  # Se accede con el nombre de la clase

p1 = Persona("Ana")
p2 = Persona("Luis")
p3 = Persona("Carlos")

print(Persona.contador)  # 3
