import logging
from datetime import datetime

# Configuración del archivo de log
logging.basicConfig(
    filename="accesos.log",
    level=logging.INFO,
    format="%(message)s"
)

def registrar(evento, usuario, intento=None):
    """
    evento: EXITOSO, FALLIDO o BLOQUEADO
    usuario: nombre del usuario
    intento: número de intento (solo para FALLIDO)
    """

    hora = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    if evento == "EXITOSO":
        mensaje = f"[EXITOSO] usuario: {usuario} | hora: {hora}"

    elif evento == "FALLIDO":
        mensaje = f"[FALLIDO] usuario: {usuario} | intento #{intento} | hora: {hora}"

    elif evento == "BLOQUEADO":
        mensaje = f"[BLOQUEADO] usuario: {usuario} | hora: {hora}"

    else:
        mensaje = f"[DESCONOCIDO] usuario: {usuario} | hora: {hora}"

    logging.info(mensaje)