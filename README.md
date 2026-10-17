# Tarea 1.1.2 (Vagrant)



# Vagrant y el Vagrantfile
**¿Qué es Vagrant y por qué resulta útil? Distingue lo que lo forma, sobre Vagrantfile y su archivo al inicio y al final**

Citando textualmente "Vagrant es un software libre que crea una capa por encima de la virtualización", permite crear, actualizar, modificar y administrar entornos virtuales reproducibles mediante código o script reproducible y de forma automatizada en cualquier equipo. Resulta util al permitir replicar un entorno virtual exactamente igual con facilidad, siendo de facil transporte y sobre todo, funcional en cualquier tipo de manquina independientemente de su sistema operativo. Se pueden distinguir:

- El anfitrión: Es quien contiene todos los archivos, lee la configuración de 'Vagrantfile' y arranca los procesos, físicamente, es la computadora donde están dichos archivos.
- El proovedor: Tambien llamado "providers", son los programas de virtualización que ejecutan las máquinas, como VirtualBox (el predeterminado), VMware o Hyper-V.
- La Box: Son las imágenes base de las máquinas virtuales preconfiguradas con un sistema operativo.
- La Máquina virtual: Es el entorno simulado que se ejecuta de manera independiente. Cree tener su propio hardware, pero todo lo que hace es virtual.
- Vagrantfile: Es un archivo capaz de escribir el tipo de la máquina necesaria para un proyecto, y cómo configurarlo y Provisiona estas máquinas, esta escrita en codigo ruby

# Aprovisionamiento 
**Investiga qué es un provisioner, dónde se ejecuta el script, cuándo lo lanza Vagrant y qué diferencia hay entre inline: y path:. Explica qué ocurre si modificas el script después del primer vagrant up y cómo lo ejecutarías de nuevo.**

Un provisioner es un mecanismo que permite automatizar la instalación de software y la configuración de la máquina virtual (el invitado o guest), como parte del proceso de vagrant up y se usa para preparar un entorno, con el fin de que se use sin intervención manual. Este se ejecuta dentro de la máquina virtual (el invitado o guest). Para sistemas Linux, Vagrant utiliza SSH, para Windows, usa WinRM (PowerShell o Batch); igualmente, el provisioning se ejecuta durante el primer vagrant up que crea el entorno. Si la máquina ya existe, no se volverá a ejecutar.

Modificar el contenido de un script de cualquier manera generar cambios, más no se ejecutaran la próxima vez que ejecutes vagrant up o vagrant reload y para poder ejecutarlo se pueden realizar de dos maneras:
- Mediante 'vagrant provision' que aplica los provisioners a una maquina encendida, ejecutando los scripts de nuevo y aplicando las modificaciónes
- O mediante 'vagrant reload' --provision: que reinicia la máquina y fuerza la ejecución del provisioning al arrancar.

**Diferencia entre inline: y path:** Ambos son argumentos del provisioner de tipo shell, mientras inline especifica un comando o secuencia de comandos directamente en el Vagrantfile como una cadena de texto, path sin embargo, especifica la ruta a un archivo de script local (en tu host) que Vagrant subirá a la máquina virtual y luego ejecutará, siendo más complejo. 

# Interfaces y redes
**Investiga qué conexión de red configura Vagrant por defecto y para qué la utiliza. Averigua cómo se añade en el Vagrantfile una segunda interfaz con dirección IP fija. Compara NAT, red interna, red privada host-only y red pública: explica con quién puede comunicarse la máquina en cada caso y qué función cumple el reenvío de puertos.**

Vagrant, por defecto, configura la primera red (eth0) como NAT, garantizando que se pueda conectar a la maquina virtual y la usa principalmente para establecer conexiones SSH y reenvio de puertos. Para añadir una segunda interfaz de red con una dirección IP estática, se utiliza la configuración 'private_network' en el Vagrantfile. Esto crea típicamente una red host-only, permitiendo la comunicación directa entre el host y la VM.

El reenvío de puertos permite acceder a un puerto de la máquina virtual (guest) a través de un puerto de la máquina host. El tráfico que llega a un puerto específico del host se redirige automáticamente al puerto correspondiente en la VM, es la que nos permite acceder a los servicios que se ejecutan dentro de la VM (como un servidor web) desde el navegador del host. 

Por ejemplo, con la configuración mostrada a continuación significa que el puerto 8080 del Host reenviaria su puerto al puerto 80 de la Maquia virtual en la 127.0.0.1 
```cmd
config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
```

# Órdenes y carpeta compartida. 
**En una tabla breve, indica cuándo usarías up, status, ssh, reload, provision, halt y destroy; marca cuáles llegaste a ejecutar. Averigua qué es /vagrant y comprueba qué archivos aparecen allí.**

| Comando a usar | Cuando se deberian usarse | ¿Las he utilizado? |
| --- | --- | --- |
| ```up``` | --- | --- |
| ```status``` | --- | --- |
| ```reload``` | --- | --- |
| ```provision``` | --- | --- |
| ```halt``` | --- | --- |
| ```destroy``` | --- | --- |


***Sección B:** Practica*

**Presenta un esquema de la arquitectura con sus dos interfaces**

![Esquema](fotosreferencia/Esquema.png)

**Describe la configuración del "Vagrantfile" y cuenta cómo has preparado Apache.**

```
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.hostname = "debian-joaquin"

  # Reenvío de puerto 8080 del Host al 80 de la VM en 127.0.0.1
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Red privada (VirtualBox la crea como Red Interna / Host-Only)
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "VM-Debian-TuNombre"
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "shell", path: "setup.sh"
end

```

# Bloques de bash
Incluye el contenido completo de cada script Bash en bloques de código y explica qué realiza cada una de sus órdenes. 

# Capturas de pantalla con el servidor Apache
Añade capturas de pantalla insertadas en el documento que permitan apreciar que el servidor Apache está en ejecución dentro de la máquina y que se puede acceder a su página desde el anfitrión. Elige las capturas que mejor respalden tu explicación y comenta qué muestran.

![Captura_de_status](fotosreferencia/vagrantstatus.png)

text

![Server_en_Navegador](fotosreferencia/serverinsearch.png)

text

![Direcciones_web](fotosreferencia/serverdirect.png)

text

# Bibliografía:

- Vagrant: https://www.arsys.es/blog/entorno-desarrollo-vagrant
- Las fotos utilizadas estan situadas en la carpeta fotosreferencia
