#Cómo usarlo
#Login exitoso
from logger import registrar

registrar("EXITOSO", "carlos")

#Resultado en accesos.log:
[EXITOSO] usuario: carlos | hora: 2026-06-24 14:35:10

#Intento fallido
registrar("FALLIDO", "carlos", 2)

#Resultado:
[FALLIDO] usuario: carlos | intento #2 | hora: 2026-06-24 14:36:05

#Usuario bloqueado
registrar("BLOQUEADO", "carlos")

#Resultado:
[BLOQUEADO] usuario: carlos | hora: 2026-06-24 14:37:20

#Ejemplo de integración con auth.py

#Francisco podría hacer algo como:
from logger import registrar

# Login correcto
registrar("EXITOSO", username)

# Login incorrecto
registrar("FALLIDO", username, intentos)

# Usuario bloqueado
registrar("BLOQUEADO", username)