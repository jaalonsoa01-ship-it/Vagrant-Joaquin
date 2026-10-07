#!/usr/bin/env bash
set -e

apt-get update -y
apt-get install -y apache2

systemctl enable apache2
systemctl start apache2

HOSTNAME=$(hostname)
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Entorno Vagrant - Apache</title>
</head>
<body>
    <h1>Servidor Apache de Aprovisionamiento</h1>
    <p><strong>Estudiante / Desarrollador:</strong> JOAQUIN</p>
    <p><strong>Hostname de la VM:</strong> ${HOSTNAME}</p>
</body>
</html>
EOF
