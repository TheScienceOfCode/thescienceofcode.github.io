---
title: "SDL en VSCode con C/C++"
url: "sdl-vscode-c-cpp-debug"
titleHtml: "<small>Programación y depuración de</small><br><b>SDL en VSCode con C/C++</b>"
license: ccby4.0
author: The Science of Code
date: 2024-01-26
categories:
- sdl
tags:
- sdl
- vscode
- setup
- install
- c
- c++
- cpp
- debug
- gdb
- linux
- windows
keywords:
- sdl
- vscode
- setup
- install
- c
- c++
- cpp
- debug
- gdb
- linux
- windows
autoThumbnail: true
autoThumbnailText: <i class="fas fa-gamepad"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff;
coverImage: /images/posts/sdl-tutorial.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Esta guía práctica muestra un *setup* configurando **VSCode** para programación de videojuegos usando **SDL** y **C/C++**. La instalación de librerías adicionales como **SDL Image**, **SDL Mixer** y **SDL TTF**, también está cubierta por este tutorial.
<!--more-->

Ya sea desde **Linux**, **Windows** o **Mac**, al finalizar está guía práctica tendremos preparado un entorno para desarrollar desde **VSCode** (o **VSCodium**) con videojuegos con **SDL**, incluyendo la configuración de herramientas de depuración y compilación, así como ayudas autocompletado y resaltado de sintaxis para una mejor experiencia de desarrollo en **C/C++**. 

{{< toc center >}}

---

## Descargar el proyecto base

> **Requisitos**:
> * [VSCode](https://code.visualstudio.com/) o [VSCodium](https://vscodium.com/) instalado.
> * [git](https://git-scm.com/downloads) instalado.

En **The Science of Code** hemos preparado un proyecto base [en este repositorio](https://github.com/TheScienceOfCodeEDU/sdl-vscode-c-cpp), que permite usar **SDL** con **C/C++** en **VSCode** (**VSCodium**). El proyecto viene preparado para correr en **Linux**, **Mac** y **Windows**.

Dicho esto, vamos a la ubicación donde queramos descargarlo y ejecutamos el siguiente comando:

```
git clone https://github.com/TheScienceOfCodeEDU/sdl-vscode-c-cpp.git
```

Realizado esto se puede ver el contenido del proyecto, pero antes de poder ejecutarlo y revisarlo, debe configurarse el sistema.

## Configuración del IDE

* For **VSCodium** install these extensions:
    * [Native Debug](https://open-vsx.org/extension/webfreak/debug)
    * [C/C++ extension pack](https://open-vsx.org/extension/franneck94/vscode-c-cpp-dev-extension-pack)
    * [clangd](https://open-vsx.org/extension/llvm-vs-code-extensions/vscode-clangd)

* For **VSCode** install these extensions:
    * [Native Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)
    * [C/C++ extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)
    * [clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd)

## Configuración del sistema operativo

### Linux

* Fedora:
  ```
  sudo dnf install gcc-c++
  sudo dnf install SDL2 SDL2-devel SDL2_image-devel SDL2_mixer-devel SDL2_ttf-devel
  ```

* Ubuntu:
  ```
  sudo apt install build-essential
  sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev
  ```

> Para cualquier otra **distro**, por favor revisar en la documentación oficial cómo instalar los paquetes de **gcc** y **sdl 2 development**.  

---

### Mac

1. Instalar [brew](https://brew.sh/).

2. Ejecutar estos comandos:

   ```
   xcode-select --install
   brew install SDL2
   brew install sdl2_image
   brew install sdl2_mixer
   brew install sdl2_ttf
   ```
> Por defecto, hemos activado LLDB como depurador (debugger), en otro caso es necesario [certificar los binarios de **GDB**](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Instalar MinGW-w64:** Instalar [MSYS2](https://www.msys2.org/) en la carpeta por defecto **c:\\msys64\\**, sino se hace en esta ruta, es necesario modificar las tareas que están en la carpeta *.vscode* (del proyecto base).

   Al terminar, asegurarse que la casilla *Run MSYS2 now* está activa. Esto abrirá una terminal MSYS2. Ejecutar este comando e instalar todos los paquetes sugeridos:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Instalar SDL2**:

   * Abrir [SDL2 Releases](https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5) y descargar **SDL2-devel-2.28.5-mingw.zip**. Abrir el archivo zip y una vez adentro, ir a **SDL2-2.28.5\\x86_64-w64-mingw32\\**, extraer el contenido (cuatro carpetas) en **c:\sdl2\\**.

   * Abrir [SDL2 Image Releases](https://github.com/libsdl-org/SDL_image/releases/tag/release-2.8.2) y descargar **SDL2_image-devel-2.8.2-mingw.zip**. Abrir el archivo zip y una vez adentro, ir a **SDL2_image-2.8.2\x86_64-w64-mingw32**, extraer el contenido (tres carpetas) en **c:\sdl2\\**.

   * Abrir [SDL2 Mixer Releases](https://github.com/libsdl-org/SDL_mixer/releases/tag/release-2.8.0) y descargar **SDL2_mixer-devel-2.8.0-mingw.zip**. Abrir el archivo zip y una vez adentro, ir a **SDL2_mixer-2.8.0\x86_64-w64-mingw32**, extraer el contenido (tres carpetas) en **c:\sdl2\\**.

   * Abrir [SDL2 TTF Releases](https://github.com/libsdl-org/SDL_ttf/releases/tag/release-2.22.0) y descargar **SDL2_ttf-devel-2.22.0-mingw.zip**. Abrir el archivo zip y una vez adentro, ir a **SDL2_ttf-2.22.0\x86_64-w64-mingw32**, extraer el contenido (tres carpetas) en **c:\sdl2\\**.


3. **Configurar variables de entorno**:

   * Buscar la palabra **variables** en el menú de Windows y seleccionar **Editar variables de entorno para el sistema**.
   * Hacer clic en el botón **Variables de entorno**, y luego seleccionar **PATH** y hacer clic en **Editar**. Agregar dos **nuevas** líneas:

     ```
     C:\msys64\ucrt64\bin
     C:\sdl2\bin
     ```
   
     Seleccionar OK para guardar. Re-abrir cualquier programa o consola para que pueda usar el PATH actualizado.
   
     Probar estos comandos en una terminal para verificar que todo quedó bien configurado:
   
     ```
     gcc --version
     g++ --version
     gdb --version
     ```
   
     Si algo falla, volver a validar los valores del PATH comparando contra las ubicaciones reales.

## Pasos finales

> Estos pasos no son requeridos pero pueden mejorar la experiencia de desarrollo.

### Desactivar la inserción automática de encabezados (cualquier OS)

Se recomienda desactivar la inserción automática de encabezados (header) **presionando f1**, luego escribiendo **User Settings (JSON)** y presionando **Enter**. Finalmente, agregamos la siguiente línea al archivo JSON que se abre:

```json
"clangd.arguments": [ "--header-insertion=never" ],
```

### Arreglar error de sintaxis para el include SDL.h (Windows)

En Windows el resaltador de sintaxis de VSCode no encontrará los includes de SDL por defecto, para arreglar esto **presionamos f1**, escribimos **User Settings (JSON)** y presionamos **Enter**. Finalmente, agregamos las siguientes líneas al archivo JSON que se abre:

```json
"C_Cpp.intelliSenseEngine": "disabled",
"clangd.fallbackFlags": [
  "-IC:/sdl2/include/SDL2"
]
```

---

{{< rawhtml >}}
<p align="center">
 <img src="/images/posts/sdl_logo.png" alt="sdl vscode c cpp debug"/>
</p>
{{< /rawhtml >}}

## Corriendo el proyecto

De antemano, revisemos los principales archivos y carpetas del proyecto base:

* **.vscode/**: Esta carpeta contiene la configuración del IDE, incluyendo tareas para compilar y depurar C/C++.
* **common.h**: definiciones y constantes globales.
* **sdl_utils.h**: algunas funciones de utilidad para interactuar con SDL.
* **main.cpp**: código fuente para la aplicación de ejemplo de SDL.
* **build files (archivos de compilación) para cada sistema operativo**: estos archivos son llamados por VSCode (o VSCodium) cuando se ejecutando las tareas de compilación.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > Si se planea usar otras librerías, estos archivos pueden modificarse libremente para ajustarse a cada caso en particular.

Ahora, sólo abriendo la carpeta del proyecto en el IDE y presionando **ctrl + shift + b** vamos a poder compilar para **Linux**, **Windows** o **Mac**. Luego, presionando **ctrl + shift + d** podremos iniciar la depuración (debugging), revisando que hayamos seleccionado el sistema operativo correcto. Debería verse una ventana que contiene un personaje pixelart. También podríamos agregar puntos de parada en el depurador, si así lo quisiéramos.

![sdl tutorial vscode linux windows mac debug](/images/posts/sdl_tutorial.png)

¡Felicitaciones! Ya tenemos todos listo para empezar a programar videojuegos.
