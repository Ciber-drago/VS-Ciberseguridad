datos = [3, 1, 4, 1, 5]
copia = datos
for i in range (len(copia)):
    copia[i] = copia[i] * 2
datos.append(10)
print(datos)
print(copia)
# 1. ¿Qué hace y cuál es la salida exacta? 
#Crea una lista datos, hace que copia apunte a la misma lista, duplica cada elemento recorriendo copia,
#luego agrega el 10 a datos, e imprime ambas.
#salida: 
# [6, 2, 8, 2, 10, 10]
# [6, 2, 8, 2, 10, 10]
#2. ¿Por qué datos y copia cambian al mismo tiempo?
#Porque copia = datos no crea una lista nueva, solo crea una segunda variable que apunta al mismo objeto 
#en memoria. Es como tener dos nombres para la misma cosa. Cualquier cambio hecho a través de copia 
# también se ve en datos porque es literalmente la misma lista.
#3. ¿Qué diferencia habría con copia = datos[:]?
#Eso sí crea una lista nueva con los mismos valores. copia y datos serían independientes: modificar
#copia no afectaría datos y viceversa. El append(10) en datos no aparecería en copia.
#4. ¿Qué tipo de estructura es modificable en Python?
#Las listas (list) son la respuesta principal aquí. En general las estructuras mutables son: list, dict,
#set y bytearray. Las inmutables son tuple, str, frozenset.
#5. Reescribir para que datos no cambie al modificar copia:
datos = [3, 1, 4, 1, 5]
copia = datos[:]          # copia independiente

for i in range(len(copia)):
    copia[i] = copia[i] * 2

datos.append(10)
print(datos)   # [3, 1, 4, 1, 5, 10]  → no cambió por el bucle
print(copia)   # [6, 2, 8, 2, 10]