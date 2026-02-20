Para disco duro externo: 


Conecta el disco duro externo por USB.

Abre Explorador de Archivos → Este equipo y mira la letra del disco (ej: E:).

Abre el script y cambia esta línea para que sea esa letra:

$Drive = "E:"

Abre Docker Desktop y asegúrate que Docker tenga acceso al disco externo:

Settings/Configuración → Resources → File Sharing

Marca/permite el disco (ej: E:\)

Aplica los cambios y reinicia Docker si te lo pide

Abre PowerShell y ejecuta el script.

Abre Navidrome en el navegador:

http://localhost:4533

Cuando quieras añadir música:

Copia tu música a: E:\Music (o la letra que tengas)
