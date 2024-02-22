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

Esta guía práctica muestra un *setup* configurando **VSCode** para programación de videojuegos usando **SDL** y **C/C++**.
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

## Configuración del sistema operativo

### Linux

* Fedora:
  ```
  sudo dnf install gcc-c++
  sudo dnf install SDL2 SDL2-devel
  ```

* Ubuntu:
  ```
  sudo apt install build-essential
  sudo apt install libsdl2-dev
  ```

> Para cualquier otra **distro**, por favor revisar en la documentación oficial cómo instalar los paquetes de **gcc** y **sdl 2 development**.  

---

### Mac

1. Instalar [brew](https://brew.sh/).

2. Ejecutar estos comandos:

   ```
   xcode-select --install
   brew install SDL2
   ```
> Por defecto, hemos activado LLDB como depurador (debugger), en otro caso es necesario [certificar los binarios de **GDB**](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Instalar MinGW-w64:** Instalar [MSYS2](https://www.msys2.org/) en la carpeta por defecto **c:\\msys64\\**, sino se hace en esta ruta, es necesario modificar las tareas que están en la carpeta *.vscode* (del proyecto base).

   Al terminar, asegurarse que la casilla *Run MSYS2 now* está activa. Esto abrirá una terminal MSYS2. Ejecutar este comando e instalar todos los paquetes sugeridos:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Descargar SDL**: Ir a [paquetes de SDL2](https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5) y descargar **SDL2-devel-2.28.5-mingw.zip**.

   Abrir el zip y dentro de él dirigirse a **SDL2-2.28.5\\x86_64-w64-mingw32\\**, extraer el contenido (cuatro carpetas) en la siguiente ubicación:
   
   
   ```
   c:\sdl2\
   ```


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

4. **Pasos finales**: 

   > Estos pasos no son requeridos pero pueden mejorar la experiencia de desarrollo.

   **Arreglar error de intellisense en windows para el include SDL.h**

     En Windows el intelisense de VSCode no encontrará el include de SDL, sin embargo, podemos intervenir y seguir las sugerencias del IDE que insistirá en agregar una ruta a la extensión de C/C++ (específicamente agregar *C:/sdl2/include/SDL2*). Al final, el archivo **.vscode/c_cpp_properties.json** debería verse así:
     
     ```json
     {
         "configurations": [
             {
                 "name": "Win32",
                 "includePath": [
                     "${workspaceFolder}/**",
                     "C:/sdl2/include/SDL2"
                 ],
                 "defines": [
                     "_DEBUG",
                     "UNICODE",
                     "_UNICODE"
                 ],
                 "compilerPath": "C:\\msys64\\ucrt64\\bin\\gcc.exe",
                 "cStandard": "c17",
                 "cppStandard": "gnu++17",
                 "intelliSenseMode": "windows-gcc-x64"
             }
         ],
         "version": 4
     }
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
* **main.cpp**: código fuente para la aplicación de ejemplo de SDL.
* **build files (archivos de compilación) para cada sistema operativo**: estos archivos son llamados por VSCode (o VSCodium) cuando se ejecutando las tareas de compilación.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > Si se planea usar otras librerías, estos archivos pueden modificarse libremente para ajustarse a cada caso en particular.

Ahora, sólo abriendo la carpeta del proyecto en el IDE y presionando **ctrl + shift + b** vamos a poder compilar. Luego, presionando **F5** podremos iniciar la depuración (debugging). Deberíamos ver una ventana vacía con un rectángulo azul en movimiento. También podríamos agregar puntos de parada en el depurador, si así lo quisiéramos.

![sdl tutorial vscode linux windows mac debug](/images/posts/sdl_tutorial.png)

¡Felicitaciones! Ya tenemos todos listo para empezar a programar videojuegos.
