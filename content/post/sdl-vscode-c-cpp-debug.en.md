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

This practical guide shows a complete setup to configure **VSCode** for videogame programming with **SDL** and **C/C++**.
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

* For **VSCode** install these extensions:
    * [Native Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)
    * [C/C++ extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)

## OS configuration

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

> For any other **distro**, please check on the official documentation how to install **gcc** and **sdl 2 development** packages.  

---

### Mac

1. Install [brew](https://brew.sh/).

2. Run these commands:

   ```
   xcode-select --install
   brew install SDL2
   ```
> By default, we enabled LLDB as debugger otherwise you will need to [certify the **GDB** binary](https://stackoverflow.com/questions/66470788/how-to-set-gdb-as-debugger-for-the-c-c-extension-pf-vscode-on-macos).

---

### Windows

1. **Install MinGW-w64:** Install [MSYS2](https://www.msys2.org/) under the default folder **c:\\msys64\\**, otherwise you will need to modify the tasks under *.vscode* folder (base project).

   When complete, ensure that the box *Run MSYS2 now* is checked. This will open a MSYS2 terminal. Run this command and install all suggested packages:

   ```
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

2. **Download SDL**: Go to [SDL2 Releases](https://github.com/libsdl-org/SDL/releases/tag/release-2.28.5) and download **SDL2-devel-2.28.5-mingw.zip**.

   Open the zip file and inside it go to **SDL2-2.28.5\\x86_64-w64-mingw32\\**, extract the contents (four folders) into:
   
   
   ```
   c:\sdl2\
   ```


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

4. **Final steps**: 

   > These steps are not required, but may improve your development experience.

   **Fix windows intellisense error for SDL.h include**

     On Windows VSCode intellisense won't find SDL include but you can step over and follow the IDE suggestion to add a path to the C/C++ extension (actually you should add *C:/sdl2/include/SDL2*). In the end, the file **.vscode/c_cpp_properties.json** should look like this:
     
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

## Running the project

Beforehand, let's have an overview of the base project's main files and folders:

* **.vscode/**: this folder contains the IDE configuration including tasks to build and debug C/C++.
* **main.cpp**: source code for the sample SDL application.
* **build files for each OS**: these files are called by VSCode (or VSCodium) when executing a build task.
  * build-linux.sh
  * build-mac.sh
  * build-win.bat    

  > If you are planning to use other libraries feel free to modify build files.

Now, just open the project folder using the IDE and press **ctrl + shift + b** to build. Then press **F5** to Debug. You should see an empty window with a moving blue rectangle. You may also add debug breakpoints as required.

![sdl tutorial vscode linux windows mac debug](/images/posts/sdl_tutorial.png)

Congratulations! You have everything ready to start making videogames.

