# Create folders
mkdir C:\navidrome -Force | Out-Null
cd C:\navidrome

mkdir data -Force | Out-Null
mkdir music -Force | Out-Null

# Create docker-compose.yml
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
      - ./data:/data
      - ./music:/music
    restart: unless-stopped
"@ | Out-File docker-compose.yml -Encoding UTF8

# Start Navidrome
docker compose up -d

# Open in browser
Start-Process "http://localhost:4533"
