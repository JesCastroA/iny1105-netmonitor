# Imagen base
FROM python:3.11-slim

# Metadatos
LABEL maintainer="jes.castroa@duocuc.cl"
LABEL description="Net Monitor App - Monitoreo de infraestructura de red"
LABEL version="1.0"

# 3. Variables de entorno para Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

# Directorio de trabajo
WORKDIR /app

# 5. Instalación de utilidades de red del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    iputils-ping \
    net-tools \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# 6. Optimización de caché: Copiar SOLO requerimientos primero
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 7. Copiar el resto del código de la aplicación
COPY app/ ./

# 8. Preparación para Encargo 7: Directorio para persistencia de logs
RUN mkdir -p /app/logs

# 9. Exposición del puerto requerido
EXPOSE 5000

# 10. Comando de ejecución requerido
CMD ["python", "app.py"]