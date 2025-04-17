---
title: "raylib en VSCode con C/C++"
url: "raylib-vscode-c-cpp-debug"
titleHtml: "<small>Programación y depuración de</small><br><b>raylib en VSCode con C/C++</b>"
license: ccby4.0
author: The Science of Code
date: 2025-01-26
categories:
- raylib
tags:
- raylib
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
- raylib
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
coverImage: /images/posts/raylib-tutorial.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Esta guía práctica muestra un *setup* configurando **VSCode** para programación de videojuegos usando **raylib** y **C/C++**.
<!--more-->

Ya sea desde **Linux**, **Windows** o **Mac**, al finalizar está guía práctica tendremos preparado un entorno para desarrollar desde **VSCode** (o **VSCodium**) con videojuegos con **raylib**, incluyendo la configuración de herramientas de depuración y compilación, así como ayudas autocompletado y resaltado de sintaxis para una mejor experiencia de desarrollo en **C/C++**. 

{{< toc center >}}

---

## Descargar el proyecto base

> **Requisitos**:
> * [VSCode](https://code.visualstudio.com/) o [VSCodium](https://vscodium.com/) instalado.
> * [git](https://git-scm.com/downloads) instalado.

En **The Science of Code** hemos preparado un proyecto base [en este repositorio](https://github.com/TheScienceOfCodeEDU/raylib-vscode-c-cpp), que permite usar **raylib** con **C/C++** en **VSCode** (**VSCodium**). El proyecto viene preparado para correr en **Linux**, **Mac** y **Windows**.

Dicho esto, vamos a la ubicación donde queramos descargarlo y ejecutamos el siguiente comando:

```
git clone https://github.com/TheScienceOfCodeEDU/raylib-vscode-c.git
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
  sudo dnf install gcc-c++ cmake  git
  ```

* Ubuntu:
  ```
  sudo apt install build-essential cmake git
  ```

> ¿Otra distro? [revisar aquí](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux)

Clonar, compilar e instalar raylib:

```bash
git clone https://github.com/raysan5/raylib.git raylib
cd raylib
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
sudo make install
sudo ldconfig
```

Para más información, por favor [revisar aquí](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux).

---

### Mac

1. Instalar [brew](https://brew.sh/).

2. Ejecutar estos comandos:

   ```
   xcode-select --install
   brew install raylib
   ```
> Por defecto, hemos activado LLDB como depurador (debugger), en otro caso es necesario [certificar los binarios de **GDB**](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Instalar MinGW-w64:** Instalar [MSYS2](https://www.msys2.org/) en la carpeta por defecto **c:\\msys64\\**, sino se hace en esta ruta, es necesario modificar las tareas que están en la carpeta *.vscode* (del proyecto base).

   Al terminar, asegurarse que la casilla *Run MSYS2 now* está activa. Esto abrirá una terminal MSYS2. Ejecutar este comando e instalar todos los paquetes sugeridos:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Instalar raylib**:[Download raylib win64_mingw-w64 5.5](https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_mingw-w64.zip), luego extraer los contenidos del archivo en **C:\raylib**. Al final de este paso deberíamos tener la siguiente estructura en nuestra máquina:

   ```
   c:\raylib\include\
   c:\raylib\lib\
   c:\raylib\CHANGELOG
   c:\raylib\LICENSE
   c:\raylib\README.md
   ```


3. **Configurar variables de entorno**:

   * Buscar la palabra **variables** en el menú de Windows y seleccionar **Editar variables de entorno para el sistema**.
   * Hacer clic en el botón **Variables de entorno**, y luego seleccionar **PATH** y hacer clic en **Editar**. Agregar dos **nuevas** líneas:

     ```
     C:\msys64\ucrt64\bin
     ```

     ```
     C:\raylib\bin
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

### Arreglar error de sintaxis para el include raylib.h (Windows)

En Windows el resaltador de sintaxis de VSCode no encontrará los includes de raylib por defecto, para arreglar esto **presionamos f1**, escribimos **User Settings (JSON)** y presionamos **Enter**. Finalmente, agregamos las siguientes líneas al archivo JSON que se abre:

```json
"C_Cpp.intelliSenseEngine": "disabled",
"clangd.fallbackFlags": [
    "-IC:/raylib/include"
]
```


---

{{< rawhtml >}}
<p align="center">
 <img src="/images/posts/raylib_logo.png" alt="raylib vscode c cpp debug"/>
</p>
{{< /rawhtml >}}

## Corriendo el proyecto

De antemano, revisemos los principales archivos y carpetas del proyecto base:

* **.vscode/**: Esta carpeta contiene la configuración del IDE, incluyendo tareas para compilar y depurar C/C++.
* **main.c**: código fuente para la aplicación de ejemplo de raylib.
* **build files (archivos de compilación) para cada sistema operativo**: estos archivos son llamados por VSCode (o VSCodium) cuando se ejecutando las tareas de compilación.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > Si se planea usar otras librerías, estos archivos pueden modificarse libremente para ajustarse a cada caso en particular.

Ahora, sólo abriendo la carpeta del proyecto en el IDE y presionando **ctrl + shift + b** vamos a poder compilar para **Linux**, **Windows** o **Mac**. Luego, presionando **ctrl + shift + d** podremos iniciar la depuración (debugging), revisando que hayamos seleccionado el sistema operativo correcto. Debería verse una ventana que contiene un texto. También podríamos agregar puntos de parada en el depurador, si así lo quisiéramos.

![raylib tutorial vscode linux windows mac debug](/images/posts/raylib_tutorial.png)

¡Felicitaciones! Ya tenemos todos listo para empezar a programar videojuegos con **raylib** y VSCode (VSCodium).
