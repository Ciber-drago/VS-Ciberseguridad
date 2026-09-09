#6. ¿Cómo harías un conversor de pulgadas a metros?
#Lo primero que hay que saber es la fórmula de conversión: 1 pulgada equivale a 0.0254 metros.
#Después hay que pensar en lo práctico: el usuario tiene que poder ingresar el valor, así que necesito
# input(). Y como input() siempre devuelve texto, tengo que convertirlo a número con float() porque
# alguien podría escribir 5.5 pulgadas, no solo números enteros.
#También hay que proteger el programa por si el usuario escribe letras en vez de números, ahí 
#entra el try/except. Y para que la salida se vea bien, muestro el resultado redondeado a 2 decimales
# con :.2f.
# Por último lo meto en una función para que el código quede ordenado y se pueda reutilizar fácil.
#7. Programa completo:
def pulgadas_a_metros(pulgadas):
    return pulgadas * 0.0254

y = True
while y == True:
    entrada = input("Ingrese la cantidad de pulgadas: ")
    try:
        pulgadas = float(entrada)
        y = False
    except:
        print("Entrada incorrecta, ingrese un numero valido.")

metros = pulgadas_a_metros(pulgadas)
print(f"{pulgadas} pulgadas equivalen a {metros:.2f} metros")
#Ejemplo de salida si el usuario escribe 100:
#100.0 pulgadas equivalen a 2.54 metros