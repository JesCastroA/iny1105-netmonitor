# 1. Imagen base requerida
FROM nginx:alpine

# 2. Metadatos de autoría
LABEL maintainer="Jesus Castro"
LABEL description="NGINX Reverse Proxy - Net Monitor App"

# 3. Eliminar la configuración por defecto de NGINX
RUN rm /etc/nginx/conf.d/default.conf

# 4. Copiar tu configuración personalizada (¡Con la ruta corregida!)
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# 5. Exponer el puerto HTTP
EXPOSE 80

# 6. Iniciar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]
