---
title: "SDL en VSCode con C/C++"
url: "sdl-vscode-c-cpp-debug"
titleHtml: "<small>Programación y depuración de</small><br><b>SDL en VSCode con C/C++</b>"
license: ccby4.0
author: The Science of Code
date: 2024-01-15
categories:
- linux
tags:
- sdl
- vscode
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
coverImage: /images/posts/fedora-kde.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Una guía práctica para configurar un entorno de desarrollo para **SDL** con **C/C++** con herramientas de código libre.
<!--more-->

Este tutorial explica cómo preparar una máquina para programar videojuegos con **SDL** y **C/C++**, usando **VSCode** como editor. Hemos preparado un entorno listo para usarse, incluyendo la configuración de herramientas de depuración y compilación, así como ayudas autocompletado y resaltado de sintaxis para una mejor experiencia de desarrollo. Con soporte para **Linux**, **Windows** y **Mac**.

{{< toc center >}}

---


## Pre-requisitos

* [VSCode](https://code.visualstudio.com/) o [VSCodium](https://vscodium.com/) instalado.
* [git](https://git-scm.com/downloads) instalado.

## Descargar el proyecto base

Para mayor agilidad, en **The Science of Code** hemos preparado un proyecto base de **SDL** con **C/C++** en **VSCode**; el proyecto viene pre-configurado para **Linux**, **Mac** y **Windows**.

Dicho esto, vamos a la ubicación donde queramos descargarlo y ejecutamos el siguiente comando:

```
git clone https://github.com/TheScienceOfCodeEDU/sdl-vscode-c-cpp.git
```

Realizado esto se puede ver el contenido del proyecto, pero antes de poder ejecutarlo y revisarlo, debe configurarse el sistema.

## Configuración del IDE

* For **VSCodium** install these extensions:
    * [Native Debug](https://open-vsx.org/extension/webfreak/debug)
    * [C/C++ extension pack](https://open-vsx.org/extension/franneck94/vscode-c-cpp-dev-extension-pack)

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
---

### Mac

Install [brew](https://brew.sh/) then run these commands:

```
xcode-select --install
brew install SDL2
```

By default, we enabled LLDB as debugger otherwise you will need to [certify the **GDB** binary](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

#### Install MinGW-w64 

Install [MSYS2](https://www.msys2.org/) under the default folder **c:\\msys64\\**, otherwise you will need to modify the tasks under *.vscode* folder.

 When complete, ensure the Run MSYS2 now box is checked and select Finish. This will open a MSYS2 terminal window for you. Run this command and install all suggested packages:

 ```
 pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
 ```

#### SDL2

Go to [SDL2 Releases](https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5) and download **SDL2-devel-2.28.5-mingw.zip**.

Open the zip file and inside it go to **SDL2-2.28.5\\x86_64-w64-mingw32\\**, extract the contents (four folders) into **c:\sdl2\\**


#### Environment variables

* Search for **variables** under your Windows menu and select **Edit environment variables for your system**.
* Click on **Environment variables** button, and then select **Path** and click **Edit**. Add two **new** lines:

```
C:\msys64\ucrt64\bin
C:\sdl2\bin
```

Select OK to save and re-open any program or console to use the updated PATH.

Test these commands on a terminal to check if everything went OK:

```
gcc --version
g++ --version
gdb --version
```

If something fails, double check your PATH values against real folder locations.

#### Fix intellisense error for SDL.h include

On Windows VSCode intellisense won't find SDL include but you can step over and follow the IDE suggestion to add a path to the C/C++ extension (add *C:/sdl2/include/SDL2*). In the end, the file **.vscode/c_cpp_properties.json** should look like this:

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

Open the project and press **ctrl + shift + b** to build. Then press **F5** to Debug. You should see an empty window with a moving blue rectangle. You may add debug breakpoints as required.

Congratulations! You have everything ready to start making videogames.
