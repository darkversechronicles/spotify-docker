# ==========================================
# Navidrome en Disco Externo (USB)
# Instalación nueva (todavía sin música)
# ==========================================

# 1) IMPORTANTE: Cambia esto por la letra de tu disco externo USB (ejemplo: E:)
$Drive = "E:"

# 2) Crear carpetas EN el disco externo
#    - data = base de datos/configuración de Navidrome
#    - Music = carpeta vacía por ahora; luego copiarás tu música aquí
New-Item -ItemType Directory -Path "$Drive\Navidrome" -Force | Out-Null
New-Item -ItemType Directory -Path "$Drive\Navidrome\data" -Force | Out-Null
New-Item -ItemType Directory -Path "$Drive\Music" -Force | Out-Null

# 3) Crear una carpeta local en C: para guardar el docker-compose.yml
#    (Los datos y la música seguirán viviendo en el disco externo)
New-Item -ItemType Directory -Path "C:\navidrome" -Force | Out-Null
Set-Location "C:\navidrome"

# 4) Crear docker-compose.yml
#    NOTAS:
#    - Montamos (volumes) las carpetas del disco externo dentro del contenedor:
#        "$Drive\Navidrome\data" -> /data   (DB/config de Navidrome)
#        "$Drive\Music"          -> /music  (tu librería de música, solo lectura)
#    - ":ro" significa solo lectura (más seguro). Quita ":ro" si algún día necesitas escritura.
@"
version: "3"
services:
  navidrome:
    image: deluan/navidrome:latest
    container_name: navidrome
    ports:
      - "4533:4533"
    environment:
      ND_SCANINTERVAL: 1m
      ND_LOGLEVEL: info
      ND_SESSIONTIMEOUT: 24h
    volumes:
      - "$Drive\Navidrome\data:/data"
      - "$Drive\Music:/music:ro"
    restart: unless-stopped
"@ | Out-File "docker-compose.yml" -Encoding UTF8

# 5) Iniciar Navidrome
#    Asegúrate de que Docker Desktop esté corriendo y que tenga permiso para acceder al disco externo.
docker compose up -d

# 6) Abrir Navidrome en el navegador
Start-Process "http://localhost:4533"

# ==========================================
# Después de instalar:
# Copia tu música dentro de:
#   $Drive\Music
# Ejemplo:
#   E:\Music
# Navidrome la escaneará automáticamente.
# ==========================================
