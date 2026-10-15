# Tarea 1.1.2 (Vagrant)

***Sección A:** Investigación*

**¿Qué es Vagrant y por qué resulta útil? Distingue lo que lo forma**
Citando textualmente "Vagrant es un software libre que crea una capa por encima de la virtualización", permite crear, actualizar, modificar y administrar entornos virtuales reproducibles mediante código o script reproducible y de forma automatizada en cualquier equipo. Resulta util al permitir replicar un entorno virtual exactamente igual con facilidad, siendo de facil transporte y sobre todo, funcional en cualquier tipo de manquina independientemente de su sistema operativo. Se pueden distinguir:

El anfitrión: Es quien contiene todos los archivos, lee la configuración de 'Vagrantfile' y arranca los procesos, físicamente, es la computadora donde están dichos archivos.
El proovedor: Tambien llamado "providers", son los programas de virtualización que ejecutan las máquinas, como VirtualBox (el predeterminado), VMware o Hyper-V.
La Box: Son las imágenes base de las máquinas virtuales preconfiguradas con un sistema operativo.
La Máquina virtual: Es el entorno simulado que se ejecuta de manera independiente. Cree tener su propio hardware, pero todo lo que hace es virtual.
Vagrantfile: Es un archivo capaz de escribir el tipo de la máquina necesaria para un proyecto, y cómo configurarlo y Provisiona estas máquinas, esta escrita en codigo ruby


**Presenta un esquema de la arquitectura con sus dos interfaces**

**Describe la configuración del "Vagrantfile" y cuenta cómo has preparado Apache.**


Incluye el contenido completo de cada script Bash en bloques de código y explica qué realiza cada una de sus órdenes. Añade capturas de pantalla insertadas en el documento que permitan apreciar que el servidor Apache está en ejecución dentro de la máquina y que se puede acceder a su página desde el anfitrión. Elige las capturas que mejor respalden tu explicación y comenta qué muestran.

Bibliografía:
Vagrant: https://www.arsys.es/blog/entorno-desarrollo-vagrant
