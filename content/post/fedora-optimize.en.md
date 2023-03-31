---
title: "Optimizing Fedora Linux: Startup and Games"
url: "fedora-linux-optimize"
titleHtml: "<small>How to optimize</small><br><b>Fedora Linux Startup and Games</b>"
license: ccby4.0
author: The Science of Code
date: 2023-01-04
categories:
- linux
tags:
- fedora
- optimize
- startup
- games
keywords:
- fedora
- optimize
- startup
- games
autoThumbnail: true
autoThumbnailText: <i class="fab fa-fedora"></i>
autoThumbnailStyle: background:#fff;color:#294172;
coverImage: /images/posts/fedora-kde.png
coverSize: min
coverStyle: background:linear-gradient(35deg,#ed4d4d,#ed9140);color:#fff
coverMetaClass: post-meta-white
thumbnailImagePosition: right
---

A practical guide to improve your experience with Fedora Linux optimizing your startup times and gaming performance.
<!--more-->

This guide applies for both **KDE** and **Gnome** flavors of Fedora Linux including versions **Fedora 36** and **Fedora 37**. Specially built for desktop users including those who play on Linux through Steam Proton, Native Games or via launchers like Lutris.

![fedora 36 37](/images/posts/fedora-kde.png)

## Startup optimization

We will start disabling some stuff that is not required for a desktop use case: 

1. Optimize startup by masking systemd-udev-settle:

   ```
   sudo systemctl mask systemd-udev-settle
   ```

   Why disable this? [More info](https://www.freedesktop.org/software/systemd/man/systemd-udev-settle.service.html)

2. Optimize startup by disabling NetworkManager-wait-online.service:

    ```
    sudo systemctl disable NetworkManager-wait-online.service
    ```

    Why disable this? [More info](https://askubuntu.com/questions/1018576/what-does-networkmanager-wait-online-service-do)

3. **For KDE**: disable check for updates at startup.

   ```
   sudo mkdir /etc/xdg/autostart.disabled
   sudo mv /etc/xdg/autostart/org.kde.discover.notifier.desktop /etc/xdg/autostart.disabled/org.kde.discover.notifier.desktop
   ```

   You may need to re-apply this commands after some system updates that restore some KDE settings to defaults.

   In case that you’ve wanted to go back, just restore the files from the backup directory autostart.disabled. 


## Gaming optimization

* Start games using **GameMode**:

  * Edit the Steam launch options for the game:

    ```
    gamemoderun %command%
    ```

  * For others, you must manually request GameMode when running the game. This can be done by launching the game through gamemoderun:

    ```
    gamemoderun ./game
    ```

  * For games/launchers which integrate GameMode support (like **Lutris**) simply running the game will automatically activate GameMode. [More info](https://github.com/FeralInteractive/gamemode).

* **On KDE** you may experience some stuttering and/or bad reposiveness while playing fullscreen games, just **disable** the **Compositor** to boost your gaming experience:

   ![fedora compositor](/images/posts/fedora-compositor.png)

   You can re-enable it manually or install the KWin script [Autocomposer](https://store.kde.org/p/1502826) that handles the entire process automatically.

## Extra tips

* Install additional codecs:

  ```
  sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
  sudo dnf groupupdate sound-and-video
  ```
  
  [More info](https://rpmfusion.org/Howto/Multimedia)

* **On KDE**: Enable Dolphin video previews:

  ```
  sudo dnf install ffmpegthumbs
  ```

* **On KDE**: Disable calendar reminder:

  ![Disable calendar reminder](https://redhat.discourse-cdn.com/fedoraproject/original/3X/c/c/cc24d98be4fcbb2b4c9a21a72de392c123bd71a3.png)

  ```
  cp /etc/xdg/autostart/org.kde.kalendarac.desktop ~/.config/autostart
  ```

  Open the file *~/.config/autostart* and modify it, replacing this line:

  ```python
  X-KDE-autostart-condition=kalendaracrc:General:Autostart:true
  ```

  With the following line:

  ```python
  X-KDE-autostart-condition=kalendaracrc:General:Autostart:false
  ```

  [More info](https://discussion.fedoraproject.org/t/how-can-i-disable-calendar-reminders/75984).


Thanks for reading. Share this publication with your friends.
