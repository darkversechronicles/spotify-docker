**Para disco duro externo: **


1. Conecta el disco duro externo por USB.

2. Abre Explorador de Archivos → Este equipo y mira la letra del disco (ej: E:).

3. Abre el script y cambia esta línea en el script para que sea esa letra:

        $Drive = "E:"

4. Abre Docker Desktop y asegúrate que Docker tenga acceso al disco externo:

     -Settings/Configuración → Resources → File Sharing

     -Marca/permite el disco (ej: E:\)

     -Aplica los cambios y reinicia Docker si te lo pide

5. Abre PowerShell y ejecuta el script.

6. Abre Navidrome en el navegador:

         http://localhost:4533

7. Cuando quieras añadir música:

       Copia tu música a: E:\Music (o la letra que tengas)
