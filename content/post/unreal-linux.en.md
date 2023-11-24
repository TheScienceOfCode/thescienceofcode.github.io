---
title: "Unreal Engine 5 Linux"
url: "unreal-5-linux"
titleHtml: "<small>How to use</small><br><b>Unreal Engine on Linux</b>"
license: ccby4.0
author: Daniel Cañizares
date: 2023-11-14
categories:
- unreal
tags:
- unreal
- ue5
- linux
keywords:
- unreal
- ue5
- linux
autoThumbnail: true
autoThumbnailText: <i class="fab fa-linux"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#646b94,#5597a6);color:black;
coverImage: /images/posts/unreal-linux.png
coverSize: min
coverStyle: background:#2c2f4c;color:#fff
thumbnailImagePosition: left
---

Complete guide to start using **Unreal Engine** on your **Linux** machine. Compatible with **UE5**, **UE5.1**, **UE5.2** and its latest version **UE5.3**.
<!--more-->

Unreal Engine is an amazing tool to create videogames and compile them for almost any (capable) device out there. Despite the fact that Unreal is an awesome **multiplatform** engine, trying to run its **editor** on Linux can be obscure and troublesome. This is a compact but comprehensive guide that includes instructions to install, execute and troubleshoot **UE 5 for Linux**.

![unreal linux](/images/posts/unreal-linux.png)

# Quick start

1. Download the [official binaries](https://www.unrealengine.com/en-US/linux). They may work with almost any distribution, if you have problems see [Building Unreal Engine](#building-unreal-engine) to compile your own version of the engine.

2. Extract Unreal Engine on any location, for example:

    ```
    # It's a good idea to create a folder per VERSION
    $HOME/Unreal/VERSION/

    # Example
    $HOME/Unreal/5.1.0/
    $HOME/Unreal/5.2.0/
    $HOME/Unreal/5.2.1/
    $HOME/Unreal/5.3.0/
    ```

3. Go inside the extracted folder **Engine/Binaries/Linux** and execute the file: **UnrealEditor**. You should see the Unreal Engine Editor just working.

4. Open or create a project. After that you will be able to open your project with your IDE (if it has C++ code) and compile it as usual. We recommend [Rider Linux](https://www.jetbrains.com/rider/download/#section=linux) as IDE because it offers the best development experience for Unreal C++.

## Recommended configuration

Optionally, you can configure the build process to use the maximum power of your CPU. Follow these steps:

1. Configure **max build parallel actions** and **unity build** modifying or creating the following file:

   ```
   $HOME/.config/Unreal Engine/UnrealBuildTool/BuildConfiguration.xml
   ```

2. Set the contents of the file, accordingly to your CPU specifications, for example:

   ```xml
   <?xml version="1.0" encoding="utf-8" ?>

   <Configuration xmlns="https://www.unrealengine.com/BuildConfiguration">

   <ParallelExecutor>
      <MaxProcessorCount>30</MaxProcessorCount>
      <ProcessorCountMultiplier>2</ProcessorCountMultiplier>
      <!-- Free memory per action in bytes, used to limit the number of 
        parallel actions if the machine is memory starved. 
        Set to 0 to disable free memory checking.
        PROCEED WITH CAUTION -->
      <MemoryPerActionBytes>0</MemoryPerActionBytes>
    </ParallelExecutor>

    <BuildConfiguration>
      <bUseUnityBuild>true</bUseUnityBuild>
      <bForceUnityBuild>true</bForceUnityBuild>
    </BuildConfiguration>

    </Configuration>
    ```

In the previous example, by setting **ProcessorCountMultiplier to 2**, the build process takes into account logical threads (if your CPU supports *Simultaneous Multi Threading (SMT)* or *hyper-threading*) to calculate the max actions to execute in parallel. Then, setting **MaxProcessorCount to 30** limits the compile thread count to 30. So if your CPU has 16 physical cores and 2 logical cores each (32 in total), this leaves 2 logical cores entirely free for other software, resulting in a smoother experience when multitasking during project compilation. *This can change depending on your available RAM if you do not set **MemoryPerActionBytes** to 0, but doing that can eventually crash your system.*

If your settings have been configured properly, you will get the following UE build process output:

```
Building XXX actions with 30 processes...
```

The second part is related with these two properties to reduce compilation times:
* **bUseUnityBuild**: Whether to unify C++ code into larger files for faster compilation. 
* **bForceUnityBuild**: Whether to force C++ source files to be combined into larger files for faster compilation.

More info:
 * [Source](https://gpuopen.com/learn/threadripper-for-gamedev-ue4/)
 * [Oficial link](https://docs.unrealengine.com/5.1/en-US/build-configuration-for-unreal-engine/) see ParallelExecutor section.

> If you're using [PlasticSCM](https://www.plasticscm.com/) as your **Source Control** you can use our extension to see your GitHub issues directly on Plastic: [Equilaterus PlasticSCM+GitHub](https://github.com/equilaterus-gamestudios/PlasticSCM-GitHub-extension)

## Common issues

* **I have VSCodium instead of VSCode (or any other IDE):** just try to create a new C++ project and disable VSCode when Unreal asks for it.

* **Could not locate the assembly "Ionic.Zip.Reduced":** go to your **Engine/Binaries/DotNet/UnrealBuildTool** and locate the file **Ionic.Zip.Reduced**, duplicate that file into the parent folder **Engine/Binaries/DotNet/**.

* **Unreal Startup is extremely slow with a C++ project:** run (NOT debug) the project. Use debug mode only when you require to actually *debug the code*. It is a little bit unconfortable but your project will load pretty fast.

* **C++ debug does not show variable contents:** you can enable pretty printers by downloading [these files from Unreal Repo](https://github.com/EpicGames/UnrealEngine/tree/release/Engine/Extras/LLDBDataFormatters) and modifying (or creating) **$HOME/.lldbinit** with the following content:

  ```
  settings set target.inline-breakpoint-strategy always
  command script import "/home/your_user/path_to/UEDataFormatters.py"
  ```

  It's weird that they are not included with UE5 binaries for Linux. **But** even with those files are still some [issues](https://youtrack.jetbrains.com/issue/RIDER-87427).

* My project does not open / Unreal not detected .uproject: If you have problems opening your uproject check that:
  * **.config/Epic/UnrealEngine/Install.ini** has a content like this one:
    
    ```ini
    [Installations]
    5.1=/home/YOUR_USER/Unreal/5.1.0
    5.3=/home/YOUR_USER/Unreal/5.3.2
    ```

    Replace GUIDs like *B4BA80E5-061F-406C-B07C-A6C2AC42AE61* and names like *UE_5.3* with a simpler 5.x and double check the installation path.

  * Set a corresponding version for your **.uproject**:

    ```
    {
      "FileVersion": 3,
      "EngineAssociation": "5.3", <- CHECK  THIS ONE
      ...
    ```

* Graphical issues:
  * Virtual Shadow Maps (VSM) Artifacts: ![shadow artifacts ue5 lumen vsm](https://docs.unrealengine.com/5.1/Images/building-virtual-worlds/lighting-and-shadows/shadows/virtual-shadow-maps/vsm-max-pages-exceeded-artifact.webp)
  
    With Virtual Shadow Maps, all of the shadow data in the scene for all lights is stored in a single large texture pool. The default pool size is affected by the Shadow Scalability setting, but it may need to be adjusted in scenes with many lights using high resolution shadows.

    Alternatively it may need to be adjusted on lower-end hardware to save video memory.

    The page pool size can be adjusted using **r.Shadow.Virtual.MaxPhysicalPages** (default 4096, test with multiple values, but going up too much can crash the editor). Enabling Virtual Shadow Map stats with **r.ShaderPrintEnable 1** and **r.Shadow.Virtual.ShowStats 2**, in succession, will display statistics about the current page pool use.

    Alternatively, you can disable VSM cache by using this command: **r.Shadow.Virtual.Cache 0**.

    **NOTE**: To enable VSM on Linux on UE5.3 or later, you need to go to **Project Settings / Platforms / Linux** and under **Targeted RHIs** enable the option **Vulkan Desktop (SM6)** BUT disabling *Vulkan Desktop (SM5)*.

    More info: [UE Docs](https://docs.unrealengine.com/5.2/en-US/virtual-shadow-maps-in-unreal-engine/#onepassprojection)


# Building Unreal Engine

Alternatively you can compile and generate your own binaries of **Unreal Engine**, just follow these steps:

1. Prepare your GitHub account to see the repo: [See this guide](https://www.unrealengine.com/en-US/ue-on-github)

2. Clone or download from: [GitHub Repo](https://github.com/EpicGames/UnrealEngine).

3. After downloading, execute **Setup.sh**:

   ```sh
   ./Setup.sh
   ```

3. Generate files (but do not *make*, to avoid recompiling twice).

   ```sh
   ./GenerateProjectFiles.sh

   # Do not execute this command 
   # make
   ```

4. Go to **Engine/Build/BatchFiles/**, and execute the following command:

   ```sh
   /RunUAT.sh BuildGraph -target="Make Installed Build Linux" -script=Engine/Build/InstalledEngineBuild.xml -clean -set:HostPlatformOnly=true -set:WithDDC=false -set:GameConfigurations="Development;Shipping"
   ```

   *If there are errors with dependencies*: Copy **Engine/Binaries/DotNET** (from source folders) the output path  **LocalBuilds/Engine/Linux/Engine/Binaries/DotNET**. Re-run previous command.

6. Copy the results from **LocalBuilds/Engine/Linux** folder to any other location.

7. Open the editor executable, located at: **{any other location}/Engine/Binaries/Linux/UnrealEditor**.

## Common build errors

* Dependencies errors:
  * **Could not locate the assembly "Ionic.Zip.Reduced":** go to your **Engine/Binaries/DotNet/UnrealBuildTool** and locate the file **Ionic.Zip.Reduced**, duplicate that file into the parent folder **Engine/Binaries/DotNet/**.
  * [Blog birost post](https://blog.birost.com/a?ID=01650-81b216da-49aa-49a2-81f4-9b699aed1057)
  * [Unreal forum thread](https://forums.unrealengine.com/t/linux-build-missing-references/296487)


## Other options

* [Unreal containers installed build](https://unrealcontainers.com/docs/use-cases/linux-installed-builds)


# More information

* Check our Wiki (Equilaterus Wiki):
  * [UE Programming](https://equilaterus.com/wiki/docs/unreal/ue-programming/)
  * [UE C++](https://equilaterus.com/wiki/docs/unreal/ue-cpp/)
  * [UE Content creation](https://equilaterus.com/wiki/docs/unreal/ue-content-creation/)

* Visit [Unreal Slackers](https://unrealslackers.org/)

* Write a comment below!

Thanks for reading. Share this publication with your friends.
