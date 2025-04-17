---
title: "raylib on VSCode with C/C++"
url: "raylib-vscode-c-cpp-debug"
titleHtml: "<small>Programming and debugging</small><br><b>raylib on VSCode with C/C++</b>"
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
autoThumbnailStyle: background:linear-gradient(35deg,#a63333,#c7385e);color:#fff;
coverImage: /images/posts/raylib-tutorial.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

This practical guide shows a complete setup to configure **VSCode** for videogame programming with **raylib** and **C/C++**.
<!--more-->

Whether from **Linux**, **Windows** or **Mac**, at the end of this practical guide we will have prepared an environment to develop from  **VSCode** (or **VSCodium**) videogames with **raylib**, including the configuration of debugging and compilation tools, as well as autocompletion and syntax highlighting aids for a better development experience in **C/C++**. 

{{< toc center >}}

---

## Downloading the base project

> **Requirements**:
> * [VSCode](https://code.visualstudio.com/) or [VSCodium](https://vscodium.com/) installed.
> * [git](https://git-scm.com/downloads) installed.

At **The Science of Code** we have prepared a base project [on this repo](https://github.com/TheScienceOfCodeEDU/raylib-vscode-c-cpp) that allows us to use **raylib** with **C/C++** on **VSCode** (**VSCodium**). The project is ready to run on **Linux**, **Mac** and **Windows**.

That said, go to the location where you want to download it and execute the following command:

```
git clone https://github.com/TheScienceOfCodeEDU/raylib-vscode-c.git
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
  sudo dnf install gcc-c++ cmake  git
  ```

* Ubuntu:
  ```
  sudo apt install build-essential cmake git
  ```

> Other distro? [check here](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux)

Clone, compile and install raylib:

```bash
git clone https://github.com/raysan5/raylib.git raylib
cd raylib
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
sudo make install
sudo ldconfig
```

For more information, please [check here](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux).

---

### Mac

1. Install [brew](https://brew.sh/).

2. Run these commands:

   ```
   xcode-select --install
   brew install raylib
   ```
> By default, we enabled LLDB as debugger otherwise you will need to [certify the **GDB** binary](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Install MinGW-w64:** Install [MSYS2](https://www.msys2.org/) under the default folder **c:\\msys64\\**, otherwise you will need to modify the tasks under *.vscode* folder (base project).

   When complete, ensure that the box *Run MSYS2 now* is checked. This will open a MSYS2 terminal. Run this command and install all suggested packages:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Install raylib**: [Download raylib win64_mingw-w64 5.5](https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_mingw-w64.zip), then extract the archive contents at **C:\raylib**. At the end of this step you should have the following structure on your machine:

   ```
   c:\raylib\include\
   c:\raylib\lib\
   c:\raylib\CHANGELOG
   c:\raylib\LICENSE
   c:\raylib\README.md
   ```

3. **Configure environment variables**:

   * Search for **variables** under your Windows menu and select **Edit environment variables for your system**.
   * Click on **Environment variables** button, and then select **Path** and click **Edit**. Add two **new** lines:

     ```
     C:\msys64\ucrt64\bin
     ```

     ```
     C:\raylib\lib
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

### Fix syntax error for raylib.h include (Windows)

On Windows VSCode syntax highlighter won't find raylib includes by default, to fix this just **hit f1**, type **User Settings (JSON)** and press **Enter**. Finally, add the following lines to the opened JSON file:

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

## Running the project

Beforehand, let's have an overview of the base project's main files and folders:

* **.vscode/**: this folder contains the IDE configuration including tasks to build and debug C/C++.
* **main.c**: source code for the sample raylib application.
* **build files for each OS**: these files are called by VSCode (or VSCodium) when executing a build task.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > If you are planning to use other libraries feel free to modify build files.

Now, just open the project folder using the IDE and press **ctrl + shift + b** to build for **Linux**, **Windows** or **Mac**. Then press **ctrl + shift + d** to Debug, just double check that you are choosing the right OS. You should see a window containing a text. You may also add debug breakpoints as required.

![raylib tutorial vscode linux windows mac debug](/images/posts/raylib_tutorial.png)

Congratulations! You have everything ready to start making videogames with **raylib** and VSCode (or VSCodium).

