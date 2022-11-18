---
title: "Unreal Engine 5 Linux"
url: "unreal-5-linux"
titleHtml: "<small>Cómo usar</small><br><b>Unreal Engine en Linux</b>"
license: ccby4.0
author: Daniel Cañizares
date: 2022-11-18
categories:
- git
tags:
- git
- github
- gitlab
- accounts
keywords:
- git
- github
- gitlab
- multiple
- accounts
autoThumbnail: true
autoThumbnailText: <i class="fab fa-linux"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#646b94,#5597a6);color:black;
coverImage: /images/posts/unreal-linux.png
coverSize: min
coverStyle: background:#2c2f4c;color:#fff
thumbnailImagePosition: left
---

Guía completa para empezar a usar **Unreal Engine** en tu máquina **Linux**. Compatible con **UE5** y el más reciente **UE5.1**.
<!--more-->

Unreal Engine es una herramienta fantástica para crear videojuegos y compilarlos para casi cualquier dispositivo (lo suficientemente poderoso). A pesar del hecho que Unreal es un motor **multiplatforma** increíble, intentar correr su **editor** en Linux puede ser un proceso oscuro y molesto. Esta es una guía compacta pero integral, que incluye instrucciones para instalar, ejectuar y corregir los errores más comunes de **UE 5 para Linux**.

![unreal linux](/images/posts/unreal-linux.png)

# Inicio rápido

1. Descargar los [binarios oficiales](https://www.unrealengine.com/en-US/linux). Deberían funcionar con casi cualquier distribución, pero si tienes problemas puedes ver la sección [Compilando Unreal Engine](#compilando-unreal-engine) para obtener tus propios binarios del motor.

2. Extrae Unreal Engine en cualquier ubicación, por ejemplo:

    ```
    # Es una buena idea tener una carpeta por VERSION
    $HOME/Unreal/VERSION/

    # Ejemplo
    $HOME/Unreal/5.1.0/
    ```

3. Ir dentro del folder extraído a **Engine/Binaries/Linux** y ejecutar el archivo: **UnrealEditor**. Deberías ver el Editor de Unreal corriendo.

4. Abre o crea un proyecto. Luego eso, podrás abrir el proyecto en tu IDE (si tiene código C++) y compilarlo, como lo haces usualmente. Recomendamos [Rider Linux](https://www.jetbrains.com/rider/download/#section=linux) como IDE porque ofrece la mejor experiencia de desarrollo para Unreal con C++.

## Configuración recomendada

Opcionalmente, puedes configurar el proceso de compilación para que use todo el potencial de tu CPU. Sigue estos pasos:

1. Configura **la cantidad máxima de acciones paralelas** modificando o creando el siguiente archivo:

   ```
   $HOME/.config/Unreal Engine/UnrealBuildTool/BuildConfiguration.xml
   ```

2. Personaliza los contenidos del archivo de acuerdo a las especificaciones de tu CPU, por ejemplo:

   ```xml
   <?xml version="1.0" encoding="utf-8" ?>

   <Configuration xmlns="https://www.unrealengine.com/BuildConfiguration">

   <ParallelExecutor>
      <MaxProcessorCount>30</MaxProcessorCount>
      <ProcessorCountMultiplier>2</ProcessorCountMultiplier>
      <!-- Memoria libre por acción en bytes, usada para limitar el número
        de acciones en paralelo si la másquina no tiene suficiente memoria. 
        Ponla en 0 para desactivar el chequeo de memoria libre.
        PROCEDER CON CAUTELA -->
      <MemoryPerActionBytes>0</MemoryPerActionBytes>
    </ParallelExecutor>

    </Configuration>
    ```

En el ejemplo anterior, configurando **ProcessorCountMultiplier en 2**, el proceso de compilación tiene en cuenta los núcleos lógicos (si tu CPU supporta *Simultaneous Multi Threading (SMT)* o *hyper-threading*) para la calcular la máxima cantidad de acciones a ejecutar en paralelo. Luego, configurando **MaxProcessorCount en 30** se limita la cantidad de núcleos usandos para compilar a 30. Luego, si tu CPU tiene 16 núcleos físicos y 2 logicos por cada uno (32 en total), esto dejaría dos núcleos lógicos 2 completamente libres para otros programas, resultando en una experiencia más cómoda si llegas a cambiar entre ventanas mientras el proyecto compila. *Esto puede cambiar dependiendo de la cantidad de RAM que tenga disponible tu sistema, si no configuras **MemoryPerActionBytes** en 0, pero hacer eso puede eventualmente bloquear la máquina.*

Si aplicaste bien la configuración, en la próxima compilación de UE deberías ver algo así:

```
# Compilando XXXX accciones con 30 procesos...
Building XXX actions with 30 processes...
```

Más información:
 * [Fuente](https://gpuopen.com/learn/threadripper-for-gamedev-ue4/)
 * [Link oficial](https://docs.unrealengine.com/5.1/en-US/build-configuration-for-unreal-engine/) ver sección ParallelExecutor.

> Si usas [PlasticSCM](https://www.plasticscm.com/) para hacer **Control de Versiones** puedes usar nuestra extensión para ver tus tareas de GitHub issues directamente en Plastic: [Equilaterus PlasticSCM+GitHub](https://github.com/equilaterus-gamestudios/PlasticSCM-GitHub-extension)

## Problemas comunes

* **Tengo instalado VSCodium en vez VSCode (o cualquier otro IDE):** intenta crear un nuevo proyecto C++ y cuando Unreal lo pregunte, desactiva VSCode.

* **No puede encontrarse el ensamblado "Ionic.Zip.Reduced":** ve a tu carpeta **Engine/Binaries/DotNet/UnrealBuildTool** y ubica el archivo **Ionic.Zip.Reduced**, duplícalo en la carpeta "padre" **Engine/Binaries/DotNet/**.

* **Unreal Startup es muy lento con un proyecto  C++:** ejecuta/run (y NO depures/debug) el proyecto. Usa el modo de depuración sólo cuando realmente requieras *depurar el código*. Puede ser un poco molesto, pero tu proyecto cargará muchísimo más rápido.


# Compilando Unreal Engine

Para compilar y generar tus propios binarios de **Unreal Engine**, sigue estos pasos:

1. Prepara tu cuenta GitHub para ver el repositorio: [Ver esta guía](https://www.unrealengine.com/en-US/ue-on-github)

2. Clona o descarga: [repositorio GitHub](https://github.com/EpicGames/UnrealEngine).

3. Luego de completar la descargar, ejecuta el archivo **Setup.sh**:

   ```sh
   ./Setup.sh
   ```

3. Genera los archivos (pero no hagas un *make*, para evitar recompilar dos veces).

   ```sh
   ./GenerateProjectFiles.sh

   # No ejecutes este comando 
   # make
   ```

4. Ve a **Engine/Build/BatchFiles/**, y ejecuta este comando:

   ```sh
   /RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -clean -set:HostPlatformOnly=true -set:WithDDC=false -set:GameConfigurations="Development;Shipping"
   ```

   *Si hay errores con las dependencias*: Copia **Engine/Binaries/DotNET** (de la carpeta original) a la ruta donde se compila: **LocalBuilds/Engine/Linux/Engine/Binaries/DotNET**. Vuelve a correr el comando anterior.

6. Copia el resultado de la carpeta **LocalBuilds/Engine/Linux** a cualquier otra ubicación.

7. Abre el ejecutable del editor que se ubica en: **{cualquier otra ubicación}/Engine/Binaries/Linux/UnrealEditor**.

## Errores comunes

* Erores de dependencias:
  * **No puede encontrarse el ensamblado "Ionic.Zip.Reduced":** ve a tu carpeta **Engine/Binaries/DotNet/UnrealBuildTool** y ubica el archivo **Ionic.Zip.Reduced**, duplícalo en la carpeta "padre" **Engine/Binaries/DotNet/**.
  * [Post en Blog birost](https://blog.birost.com/a?ID=01650-81b216da-49aa-49a2-81f4-9b699aed1057)
  * [Hilo del foro de Unreal](https://forums.unrealengine.com/t/linux-build-missing-references/296487)

## Otras opciones

[Unreal containers installed build](https://unrealcontainers.com/docs/use-cases/linux-installed-builds)

# Más información

* Revisa nuestra Wiki (Equilaterus Wiki):
  * [UE Programming](https://equilaterus.com/wiki/docs/unreal/ue-programming/)
  * [UE C++](https://equilaterus.com/wiki/docs/unreal/ue-cpp/)
  * [UE Content creation](https://equilaterus.com/wiki/docs/unreal/ue-content-creation/)

* Visita [Unreal Slackers](https://unrealslackers.org/)

* Déjanos un comentario!

Gracias por leer. Comparte esta publicación con tus amigos.
