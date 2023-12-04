---
title: "Optimizando Fedora Linux: Arraque y Juegos"
url: "fedora-linux-optimize"
titleHtml: "<small>Cómo optimizar</small><br><b>Fedora Linux Arraque y Juegos</b>"
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

Una guía práctica para mejorar la experiencia con Fedora Linux, optimizando tiempos de arraque y el rendimiento al jugar.
<!--more-->

Esta guía aplica para ambos sabores de Fedora Linux, **KDE** y **Gnome** en sus versiones **Fedora 36**, **Fedora 37**, **Fedora 38** y **Fedora 39**. Construída especialmente para usuarios de escritorio incluyendo aquellos que juegan en Linux a través de Steam Proton, Juegos Nativos o lanzadores como Lutris.

![fedora 36 37 38 39](/images/posts/fedora-kde.png)

## Optimización del arranque

Comenzaremos por desactivar algunas cosas que no son requeridas para usuarios de escritorio: 

1. Optimizar el arranque ignorando systemd-udev-settle:

   ```
   sudo systemctl mask systemd-udev-settle
   ```

   ¿Por qué desactivar esto? [Más info](https://www.freedesktop.org/software/systemd/man/systemd-udev-settle.service.html)

2. Optimizar el arranque desactivando NetworkManager-wait-online.service:

    ```
    sudo systemctl disable NetworkManager-wait-online.service
    ```

    ¿Por qué desactivar esto? [Más info](https://askubuntu.com/questions/1018576/what-does-networkmanager-wait-online-service-do)

3. **Para KDE**: desactivar el chequeo automático de actualizaciones al iniciar el sistema.

   ```
   sudo mkdir /etc/xdg/autostart.disabled
   sudo mv /etc/xdg/autostart/org.kde.discover.notifier.desktop /etc/xdg/autostart.disabled/org.kde.discover.notifier.desktop
   ```

   Es probable que se deban volver a ejecutar estos comandos luego de algunas actualizaciones del sistema que restauran algunas configuraciones de KDE por defecto.

   En caso de querer devolver los cambios se pueden restaurar los archivos que quedan en el directorio de *backup* (autostart.disabled).


## Optimización para Juegos

* Iniciar los juegos usando el modo juego (**GameMode**):

  * Editar las opciones de lanzamiento de los juegos en Steam:

    ```
    gamemoderun %command%
    ```

  * Para otros juegos, se debe solicitar el GameMode manualmente. Esto se hace ejecutando el juego a través del gamemoderun:

    ```
    gamemoderun ./game
    ```

  * Para juegos/lanzadores que se integran con el GameMode (como **Lutris**) basta con ejecutar juego y el GameMode se activará automáticamente. [Más info](https://github.com/FeralInteractive/gamemode).

* **En KDE** a veces puede experimentarse *stuttering* y/o una lenta responsividad al jugar a pantalla completa, sólo debemos **desactivar** el **Compositor** para incrementar el rendimiento:

   ![fedora compositor](/images/posts/fedora-compositor.png)

   Podemos re-activarlo manualmente o instalar el script Kwin [Autocomposer](https://store.kde.org/p/1502826) que automatiza la operación completamente.

## Tips adicionales

* Instalar codecs de video adicionales:

  ```
  sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
  sudo dnf groupupdate sound-and-video
  ```
  
  [Más info](https://rpmfusion.org/Howto/Multimedia)

* **En KDE**: Activar las miniaturas de los videos en el explorador Dolphin:

  ```
  sudo dnf install ffmpegthumbs
  ```

* **En KDE**: Desactivar los recordatorios de calendario:

  ![Desactivar kde calendar reminder](https://redhat.discourse-cdn.com/fedoraproject/original/3X/c/c/cc24d98be4fcbb2b4c9a21a72de392c123bd71a3.png)

  ```
  cp /etc/xdg/autostart/org.kde.kalendarac.desktop ~/.config/autostart
  ```

  Abrir el archivo *~/.config/autostart* y modificarlo, reemplazando esta línea:

  ```python
  X-KDE-autostart-condition=kalendaracrc:General:Autostart:true
  ```

  Por la siguiente línea:

  ```python
  X-KDE-autostart-condition=kalendaracrc:General:Autostart:false
  ```

  [Más información](https://discussion.fedoraproject.org/t/how-can-i-disable-calendar-reminders/75984).

Gracias por leernos. Comparte esta publicación con tus amigos.
