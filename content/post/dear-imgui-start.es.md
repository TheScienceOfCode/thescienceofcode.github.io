---
title: "Dear ImGui inicio rápido"
url: "imgui-quickstart"
titleHtml: "<small>Cómo empezar</small><br><b>a usar Dear ImGui en Linux/Windows</b>"
license: ccby4.0
author: Daniel Cañizares
date: 2023-05-12
categories:
- imgui
tags:
- imgui
- c
- linux
keywords:
- imgui
- c
- linux
autoThumbnail: true
autoThumbnailText: <i class="fas fa-user-astronaut"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#121415,#212628);color:#ffcc00;
coverImage: /images/posts/dear-imgui-quickstart.png
coverSize: min
coverStyle: background:#233548;color:#fff
thumbnailImagePosition: left
---

Bienvenido a esta guía rápida para aquellos interesados en empezar a utilizar **Dear ImGui** en **Linux** y **Windows**.
<!--more-->

**Dear ImGui** es una librería escrita en **C++** (con integraciones para C, C#, Java, JavaScript, Rust, Go, entre muchos otros), que permite construír intefaces gráficas de una forma rápida y sencillo, facilitando una rápida iteración durante el proceso de desarrollo. En palabras de sus propios desarrolladores:

> "Favorece la simplicidad y la productividad (...) carece de ciertas características comúnmente encontradas en otras librerías de más alto nivel (...) es particularmente adecuado para la integración en motores de videojuegos (para herramientas de desarrollo), aplicaciones 3D en tiempo real, aplicaciones de pantalla completa, aplicaciones integradas o cualquier aplicación de consola donde las características del sistema operativo no son estándar".

![dear imgui linux windows](/images/posts/dear-imgui-quickstart.png)

# Guía rápida para crear un proyecto con Dear ImGui

## Prerequisitos

* Conocimientos de Git.
* Conocimientos de programación (nivel intermedio).
* Conocimientos de C/C++.

## Revisión rápida

Antes de iniciar, puede resultar ilustrativo ojear el código principal del ejemplo, así como el resultado final que produce:

![dear imgui linux windows](/images/posts/dear-imgui-quickstart-demo.png)

```cpp
// 1. Muestra la gran ventana de demostración (¡La mayor parte del código de muestra está en ImGui::ShowDemoWindow()! Puede explorar su código para obtener más información sobre Dear ImGui!).
if (show_demo_window)
    ImGui::ShowDemoWindow(&show_demo_window);

// 2. Muestra una ventana simple que creamos nosotros mismos. Usamos un par Begin/End para crear una ventana con nombre.
{
    static float f = 0.0f;
    static int counter = 0;

    ImGui::Begin("Hello, world!");                          // Crea una ventana llamada "Hello, world!" y la agrega.

    ImGui::Text("This is some useful text.");               // Muestra algún texto (también se pueden usar strings formateados)
    ImGui::Checkbox("Demo Window", &show_demo_window);      // Edita los booleanos guardando el estado abrierto/cerrado
    ImGui::Checkbox("Another Window", &show_another_window);

    ImGui::SliderFloat("float", &f, 0.0f, 1.0f);            // Edita 1 números flotante usando un control deslizante de 0.0f a 1.0f
    ImGui::ColorEdit3("clear color", (float*)&clear_color); // Edita 3 números flotantes representando un color

    if (ImGui::Button("Button"))                            // Los botones devuelven verdadero cuando se hace clic en ellos (la mayoría de los widgets devuelven verdadero cuando se editan/activan)
        counter++;
    ImGui::SameLine();
    ImGui::Text("counter = %d", counter);

    ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / io.Framerate, io.Framerate);
    ImGui::End();
}

// 3. Muestra otra ventana de ejemplo.
if (show_another_window)
{
    ImGui::Begin("Another Window", &show_another_window);   // Pasa un puntero a nuestra variable booleana (la ventana tendrá un botón de cierre que borrará el booleano cuando se haga clic)
    ImGui::Text("Hello from another window!");
    if (ImGui::Button("Close Me"))
        show_another_window = false;
    ImGui::End();
}
```  

Como se puede apreciar, es un código sencillo y compacto, sobre todo si lo comparamos con otras APIs o librerías para crear interfaces. For more information, at the end of the tutorial we leave the link to the official **Dear ImGui** repository, which contains more documentation about the library.

## Inicio rápido

> Vamos a usar como base el ejemplo [glfw-opengl3](https://github.com/ocornut/imgui/tree/master/examples/example_glfw_opengl3) oficial de **Dear ImGui**.

1. Crear un nuevo repositorio Git.

2. Dentro del repositorio usar el siguiente comando para agregar **ImGui** como [submódulo](https://git-scm.com/book/en/v2/Git-Tools-Submodules):

   ```
   git submodule add https://github.com/ocornut/imgui.git 
   ```

3. Crear un archivo con nombre [main.cpp](https://raw.githubusercontent.com/dacanizares/imgui-test/master/main.cpp) (con el contenido que se encuentra siguiendo el link). En este archivo está el código que revisamos anteriormente y unas instrucciones adicionales para crear la ventana con **GLFW**.

### Linux

1. Crear un archivo llamado [Makefile](https://raw.githubusercontent.com/dacanizares/imgui-test/master/Makefile) (con el contenido que se encuentra siguiendo el link).

2. Instalar la librería **GLFW Development**, dependiendo de la distribución esto varía, por ejemplo:

   * Fedora:

     ```
     sudo dnf install glfw-devel     
     ```

   * Ubuntu:

     ```
     apt-get install libglfw-dev     
     ```

3. Ejecutamos el comando **make** en la raiz del proyecto, y dentro de la carpeta **bin** encontraremos el ejecutable compilado.

### Windows

1. Crear un archivo [imgui-test.vcxproj](https://github.com/dacanizares/imgui-test/blob/master/imgui-test.vcxproj) (con el contenido que se encuentra siguiendo el link).

2. Descargar [GLFW 64-bit pre-compiled binaries for Windows](https://github.com/glfw/glfw/releases/download/3.3.8/glfw-3.3.8.bin.WIN64.zip). Abrir el zip, dentro la carpeta *glfw-3.3.8.bin.WIN64* y extraer los contenidos en la carpeta del proyecto **win-libs/glfw**  (creando cualquier carpeta que haga falta). Al final debería verse así:

![project library folder](https://raw.githubusercontent.com/dacanizares/imgui-test/master/.images/glfw-folder.png)

El proyecto está configurado para correr con Visual Studio 2022, en caso de que se quiera usar otra versión, editar el archivo **imgui-test.vcxproj** (buscando por la palabra *vc2022* y reemplazarlo con alguna de las que se ven en la imagen anterior).

3. Abrir el proyecto en Visual Studio y correrlo.

# Más información

* El ejemplo completo está en [este repositorio](https://github.com/dacanizares/imgui-test)

* El repositorio oficial de [Dear ImGui](https://github.com/ocornut/imgui)

* Deja un comentario.

Gracias por seguirnos. Comparte esta publicación con tus amigos.
