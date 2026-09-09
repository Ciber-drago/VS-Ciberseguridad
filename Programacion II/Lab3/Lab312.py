#1. Literal de bytes (forma mas comun)
mi_bytes = b"\xFF"

#2. Constructor bytes a partir de un entero
mi_bytes_dos = bytes([255])

#Verificacion
print(type(mi_bytes)) #<class 'bytes'>
print(mi_bytes[0]) #255