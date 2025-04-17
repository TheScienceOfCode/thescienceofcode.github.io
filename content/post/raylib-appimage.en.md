---
title: "AppImage for raylib projects"
url: "raylib-appimage"
titleHtml: "<small>Creating a linux</small><br><b>AppImage for raylib projects</b>"
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

This practical guide shows how to build an **AppImage** for a **raylib** project.
<!--more-->

This tutorial is a quickstart for Linux **AppImages**. You can use these steps on any distribution. There are three main parts: *installing appimage-buidler*, *getting raylib and a base project* and finally, *building the **AppImage***. 


## Installing AppImage-builder

Use these commands to install appimage-builder:

```sh
wget -O appimage-builder-x86_64.AppImage https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
chmod +x appimage-builder-x86_64.AppImage

# Install
sudo mv appimage-builder-x86_64.AppImage /usr/local/bin/appimage-builder
```

## Getting raylib and a base project

> **Requirements**:
> * Install **raylib** and clone base project by [following this tutorial](/raylib-vscode-c-cpp-debug).

After installing **raylib** and cloning the repository, just open the project folder using the **vscode** IDE and press **ctrl + shift + b** to build for **Linux**. Then press **ctrl + shift + d** to Debug, just double check that you are choosing the right OS. You should see a window containing a text.

![raylib tutorial vscode linux windows mac debug](/images/posts/raylib_tutorial.png)

## Building the AppImage

After building the base project, run these commands:

```sh
cd build/linux

# Create directory structure
mkdir -p AppDir/lib
# Copy executable into AppDir/
cp main AppDir/
```

Now, we are going to run a utility to generate our appimage recipe:

```sh
appimage-builder --generate
```

Follow these answers to generate a right recipe:

* ID: raylibc (could be anything)
* Application name: raylibc (could be anything)
* Icon: application-vnd.appimage (customize or use default value)
* Executable path: **main** (executable filename)
* Arguments: $@ (use default value)
* Version: latest (use default value)
* Update information: guess (use default value)
* Architecture: x86_64 (select a value according to your target CPU)

Due to the structure of the default **raylib** installation, we need to add manually the shared executables into our AppDir directory:

```sh
# This is the path for raylib x64 5.5.0
# You can customize this commands as required
cp /usr/local/lib64/libraylib.so.5.5.0 AppDir/lib/
mv AppDir/lib/libraylib.so.5.5.0 AppDir/lib/libraylib.so.550
```

Finally, we can run the command to generate our **AppImage**:

```sh
appimage-builder --recipe AppImageBuilder.yml
```