$Drive = "E:"

New-Item -ItemType Directory -Path "$Drive\Navidrome" -Force | Out-Null
New-Item -ItemType Directory -Path "$Drive\Navidrome\data" -Force | Out-Null
New-Item -ItemType Directory -Path "$Drive\Music" -Force | Out-Null

New-Item -ItemType Directory -Path "C:\navidrome" -Force | Out-Null
Set-Location "C:\navidrome"

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

docker compose up -d
Start-Process "http://localhost:4533"
