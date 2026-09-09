from typing import final

@final
class Base:
    pass

# Un linter (como MyPy) marcará esto como ERROR:
class Derivada(Base):
    pass

b = Base()
print("Base instanciada correctamente")
# Nota: Python NO lanza excepción en runtime, el error lo detecta MyPy/el linter
