---
title: "AppImage para proyectos de raylib"
url: "raylib-appimage"
titleHtml: "<small>Creando en Linux</small><br><b>Una AppImage para proyectos de raylib</b>"
license: ccby4.0
author: The Science of Code
date: 2025-04-16
categories:
- raylib
tags:
- raylib
- linux
- appimage
- tutorial
keywords:
- raylib
- linux
- appimage
- tutorial
autoThumbnail: true
autoThumbnailText: <i class="fab fa-linux"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#7ded4d,#edde55);color:#000;
coverImage: /images/posts/raylib-tutorial.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Esta guía práctica muestra cómo construir una **AppImage** para un proyecto de **raylib**.
<!--more-->

Este tutorial es una iniciación rápida para **AppImages** en Linux. Estos pasos pueden usarse en cualquier distribución. Hay tres partes principales: *instalando el appimage-buidler*, *obteniendo raylib y un base project* y finalmente, *construyendo la **AppImage***. 


## Instalando el AppImage-builder

Usar estos comandos para instalar el appimage-builder:

```sh
wget -O appimage-builder-x86_64.AppImage https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
chmod +x appimage-builder-x86_64.AppImage

# Instalar
sudo mv appimage-builder-x86_64.AppImage /usr/local/bin/appimage-builder
```

## Obteniendo raylib y un proyecto base

> **Requisitos**:
> * Instalar **raylib** y clonar el proyecto base [siguiendo este tutorial](/raylib-vscode-c-cpp-debug).

Luego de instalar **raylib** y clonar el repositorio, basta con abrir la carpeta del proyecto usando el IDE **vscode**, presionar **ctrl + shift + b** y compilar para **Linux**. Luego presionar **ctrl + shift + d** para depurar, verificar que si estemos escogiendo el SO correcto. Debería verse una ventana que contiene un texto.

![raylib tutorial vscode linux windows mac debug](/images/posts/raylib_tutorial.png)

## Construyendo la AppImage

Luego de compilar el proyecto base, ejecutamos estos comandos:

```sh
cd build/linux

# Crear la estructura de directorios
mkdir -p AppDir/lib
# Copiar el ejecutable en AppDir/
cp main AppDir/
```

Ahora vamos a correr una utilidad para generar la *receta* (recipe), de nuestra appimage:

```sh
appimage-builder --generate
```

Estas respuestas pueden usarse como guía para obtener una receta correcta:

* ID: raylibc (puede ser cualquier cosa)
* Application name: raylibc (puede ser cualquier cosa)
* Icon: application-vnd.appimage (personalizar o usar el valor por defecto)
* Executable path: **main** (nombre de archivo del ejecutable)
* Arguments: $@ (usar el valor por defecto)
* Version: latest (usar el valor por defecto)
* Update information: guess (usar el valor por defecto)
* Architecture: x86_64 (seleccionar un valor acorde a la CPU objetivo)

Debido a la estructura de la instalación por defecto de **raylib**, necesitamos añadir manualmente los ejecutables de la librería compartida a nuestro directorio AppDir:

```sh
# Esta es la ruta para raylib x64 5.5.0
# Usted puede customizar estos comandos segun lo requiera
cp /usr/local/lib64/libraylib.so.5.5.0 AppDir/lib/
mv AppDir/lib/libraylib.so.5.5.0 AppDir/lib/libraylib.so.550
```

Finalmente, podemos ejecutar el comando para generar nuestra **AppImage**:

```sh
appimage-builder --recipe AppImageBuilder.yml
```