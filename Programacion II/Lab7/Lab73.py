import string

def contar_palabras_unicas(texto):
    texto = texto.lower()
    texto = texto.translate(str.maketrans("", "", string.punctuation))
    palabras = texto.split()
    unicas = set(palabras)
    return len(unicas)

def palabra_mas_larga(texto):
    texto = texto.translate(str.maketrans("", "", string.punctuation))
    palabras = texto.split()
    mas_larga = max(palabras, key=len)
    return mas_larga

def frecuencia_caracteres(texto):
    texto = texto.lower()
    solo_letras = [c for c in texto if c.isalpha()]
    total = len(solo_letras)
    frecuencia = {}
    for letra in solo_letras:
        frecuencia[letra] = frecuencia.get(letra, 0) + 1
    resultado = {}
    for letra, cantidad in sorted(frecuencia.items()):
        porcentaje = (cantidad / total) * 100
        resultado[letra] = (cantidad, porcentaje)
    return resultado

texto = input("Ingresa el texto a analizar:\n")

print("\n========== REPORTE DE ANÁLISIS ==========")
print(f"Palabras únicas:      {contar_palabras_unicas(texto)}")
print(f"Palabra más larga:    {palabra_mas_larga(texto)}")
print("\nFrecuencia de caracteres:")
print(f"{'Letra':<8} {'Cantidad':<10} {'Porcentaje'}")
print("-" * 30)
for letra, (cantidad, porcentaje) in frecuencia_caracteres(texto).items():
    print(f"  {letra}      {cantidad:<10} {porcentaje:.2f}%")
print("=========================================")