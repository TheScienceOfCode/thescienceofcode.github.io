---
title: "SDL on VSCode with C/C++"
url: "sdl-vscode-c-cpp-debug"
titleHtml: "<small>Programming and debugging</small><br><b>SDL on VSCode with C/C++</b>"
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
- sdlimage
- sdlmixer
- sdlttf
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
- sdlimage
- sdlmixer
- sdlttf
autoThumbnail: true
autoThumbnailText: <i class="fas fa-gamepad"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff;
coverImage: /images/posts/sdl-tutorial.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

This practical guide shows a complete setup to configure **VSCode** for videogame programming with **SDL2** and **C/C++**. Installation of additional libraries such as **SDL Image**, **SDL Mixer** and **SDL TTF** is also covered by this tutorial.
<!--more-->

Whether from **Linux**, **Windows** or **Mac**, at the end of this practical guide we will have prepared an environment to develop from  **VSCode** (or **VSCodium**) videogames with **SDL**, including the configuration of debugging and compilation tools, as well as autocompletion and syntax highlighting aids for a better development experience in **C/C++**. 

{{< toc center >}}

---

## Downloading the base project

> **Requirements**:
> * [VSCode](https://code.visualstudio.com/) or [VSCodium](https://vscodium.com/) installed.
> * [git](https://git-scm.com/downloads) installed.

At **The Science of Code** we have prepared a base project [on this repo](https://github.com/TheScienceOfCodeEDU/sdl-vscode-c-cpp) that allows us to use **SDL** with **C/C++** on **VSCode** (**VSCodium**). The project is ready to run on **Linux**, **Mac** and **Windows**.

That said, go to the location where you want to download it and execute the following command:

```
git clone https://github.com/TheScienceOfCodeEDU/sdl-vscode-c-cpp.git
```

Once this is done, you can see the project contents but before running and reviewing it, we will configure the system.


## IDE configuration

* For **VSCodium** install these extensions:
    * [Native Debug](https://open-vsx.org/extension/webfreak/debug)
    * [C/C++ extension pack](https://open-vsx.org/extension/franneck94/vscode-c-cpp-dev-extension-pack)
    * [clangd](https://open-vsx.org/extension/llvm-vs-code-extensions/vscode-clangd)

* For **VSCode** install these extensions:
    * [Native Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)
    * [C/C++ extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)
    * [clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd)

## OS configuration

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

> For any other **distro**, please check on the official documentation how to install **gcc** and **sdl 2 development** packages.  

---

### Mac

1. Install [brew](https://brew.sh/).

2. Run these commands:

   ```
   xcode-select --install
   brew install SDL2
   brew install sdl2_image
   brew install sdl2_mixer
   brew install sdl2_ttf
   ```
> By default, we enabled LLDB as debugger otherwise you will need to [certify the **GDB** binary](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Install MinGW-w64:** Install [MSYS2](https://www.msys2.org/) under the default folder **c:\\msys64\\**, otherwise you will need to modify the tasks under *.vscode* folder (base project).

   When complete, ensure that the box *Run MSYS2 now* is checked. This will open a MSYS2 terminal. Run this command and install all suggested packages:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Install SDL2**:

   * **Alternative A** (easy)

     Download [this zip file](https://mega.nz/file/YFlzyJyb#waq7p7JoCKys6JbZ1gD8rtdeXX5KohbrtRObA4egvr0) and extract its contents into your computer's root path **C:\\**.

   * **Alternative B** (manual download)     

     * Browse to [SDL2 Releases](https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5) and download **SDL2-devel-2.28.5-mingw.zip**. 
     
       Open the zip file and inside it go to **SDL2-2.28.5\\x86_64-w64-mingw32\\**.
       
       Extract the contents (four folders) into **c:\sdl2\\**.

     * Browse to [SDL2 Image Releases](https://github.com/libsdl-org/SDL_image/releases/tag/release-2.8.2) and download **SDL2_image-devel-2.8.2-mingw.zip**. 
     
       Open the zip file and inside it go to **SDL2_image-2.8.2\x86_64-w64-mingw32**.
       
       Extract the contents (three folders) into **c:\sdl2\\**.

     * Browse to [SDL2 Mixer Releases](https://github.com/libsdl-org/SDL_mixer/releases/tag/release-2.8.0) and download **SDL2_mixer-devel-2.8.0-mingw.zip**. 
     
       Open the zip file and inside it go to **SDL2_mixer-2.8.0\x86_64-w64-mingw32**.
       
       Extract the contents (three folders) into **c:\sdl2\\**.

     * Browse to [SDL2 TTF Releases](https://github.com/libsdl-org/SDL_ttf/releases/tag/release-2.22.0) and download **SDL2_ttf-devel-2.22.0-mingw.zip**.
       
       Open the zip file and inside it go to **SDL2_ttf-2.22.0\x86_64-w64-mingw32**.
     
       Extract the contents (three folders) into **c:\sdl2\\**.

     > **Note**: If you want to, you can download newer versions from the repositories. Though listed versions were tested by **The Science of Code**.


3. **Configure environment variables**:

   * Search for **variables** under your Windows menu and select **Edit environment variables for your system**.
   * Click on **Environment variables** button, and then select **Path** and click **Edit**. Add two **new** lines:

     ```
     C:\msys64\ucrt64\bin
     C:\sdl2\bin
     ```
   
     Select OK to save. Re-open any program or console to use the updated PATH.
   
     Test these commands on a terminal to check if everything went OK:
   
     ```
     gcc --version
     g++ --version
     gdb --version
     ```
   
     If something fails, double check your PATH values against real folder locations.

## Final steps 

> These steps are not required, but may improve your development experience.

### Fix disable automatic header insertion (any OS)

It is recommended to disable automatic header insertion by **hitting f1**, then typing **User Settings (JSON)** and pressing **Enter**. Finally, add the following line to the opened JSON file:

```json
"clangd.arguments": [ "--header-insertion=never" ],
```

### Fix syntax error for SDL.h include (Windows)

On Windows VSCode syntax highlighter won't find SDL includes by default, to fix this just **hit f1**, type **User Settings (JSON)** and press **Enter**. Finally, add the following lines to the opened JSON file:

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

## Running the project

Beforehand, let's have an overview of the base project's main files and folders:

* **.vscode/**: this folder contains the IDE configuration including tasks to build and debug C/C++.
* **common.h**: global definitions and constants.
* **sdl_utils.h**: some utility functions to interact with SDL.
* **main.cpp**: source code for the sample SDL application.
* **build files for each OS**: these files are called by VSCode (or VSCodium) when executing a build task.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > If you are planning to use other libraries feel free to modify build files.

Now, just open the project folder using the IDE and press **ctrl + shift + b** to build for **Linux**, **Windows** or **Mac**. Then press **ctrl + shift + d** to Debug, just double check that you are choosing the right OS. You should see a window containing a pixelart character. You may also add debug breakpoints as required.

![sdl tutorial vscode linux windows mac debug](/images/posts/sdl_tutorial.png)

Congratulations! You have everything ready to start making videogames.

