---
title: "Múltiples cuentas en git"
url: "multiples-cuentas-git"
titleHtml: "<small>Cómo configurar</small><br><b>múltiples cuentas en git</b>"
license: ccby4.0
author: The Science of Code
date: 2022-11-15
categories:
- git
tags:
- git
- github
- gitlab
- accounts
keywords:
- git
- github
- gitlab
- multiple
- accounts
autoThumbnail: true
autoThumbnailText: <i class="fab fa-git-alt"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#b54846,#e48149);color:white;
coverImage: https://dacanizares.github.io/legacyblog/images/github-gitlab-ssh.png
coverSize: min
coverStyle: background:#f9f9f9;
thumbnailImagePosition: left
---

Configura tu computador para el uso simultáneo de tus cuentas **GitHub**, **Gitlab**, **Azure Repos** y **Bitbucket** con **git**. 
<!--more-->

Esta guía explica cómo configurar tu máquina para poder acceder a repositorios **git**, usando diferentes credenciales entre ellos, **sin necesidad de estar cambiando constantemente entre cuentas**. Aplica tanto para **Linux** y **Windows** (aunque puede ser replicada en *Mac* siguiendo las instrucciones de Linux). No tiene límites en la cantidad de cuentas por proveedor. 

Si usas Github Desktop, puedes ver [estas guías rápidas](https://github.com/desktop/desktop/tree/development/docs/integrations) que son más sencillas.

> Puedes tener una cuenta configurada normalmente y usar este método para añadir las demás. Por ejemplo, si usas GitHub y ya lo tienes configurado, sólo debes seguir este procedimiento para las cuentas adicionales que vayas a incluír.


## Pre-requisitos
Tener instalado GIT en tu máquina y conocer su funcionamiento básico.


## Instrucciones

1. Ir a la siguiente ubicación (*en caso de que la carpeta **.ssh** no exista, crearla*):

   ```bash
   # Linux
   ~/.ssh
  
   # Windows 
   C:\users\NOMBRE_DE_USUARIO\.ssh
   ```

2. Crear una nueva key ssh. *Importante:* Cuando se pida un passphrase, si estás en un computador de confianza, puedes dar ENTER y dejar la llave sin passphrase, de esta forma te ahorrarás tener que estarla ingresandolo constantemente (o en su defecto tener que configurar el ssh-agent).

   ```bash
   # Linux
   ssh-keygen -t rsa -b 4096

   # Windows 
   ssh-keygen.exe

   # Cuando pregunte por el filename, por ejemplo:
   file name: id_rsa_gitlab
   # Seguir instrucciones.
   ```

   Para el nombre del archivo, es recomendable usar algo descriptivo como: **id_rsa_[PROVEEDOR]_[CUENTA]**. Donde:
   * **PROVEEDOR** puede ser *github*, *gitlab*, *azurerepos*, etc. 
   * **CUENTA** (opcional) podría usarse en caso de tener más de una cuenta por **PROVEEDOR**. 
   * Por ejemplo: 
     * **id_rsa_github**
     * **id_rsa_github_work**
   
3. Al terminar el paso anterior, se crearán dos archivos, uno de ellos con extensión **.pub** (de public). Abre el archivo y copia todo su contenido para agregar la clave al proveedor respectivo:

    * [Añadir una clave SSH en Github](https://help.github.com/es/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

    * [Añadir una clave SSH en Gitlab](https://www.tutorialspoint.com/gitlab/gitlab_ssh_key_setup.htm) - Sigue las instrucciones a partir del paso 2.

    * [Añadir una clave SSH en Azure Repos](https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops&tabs=current-page) - Sigue las instrucciones a partir del paso 2.

    * [Añadir una clave SSH en Bitbucket](https://confluence.atlassian.com/bitbucketserver/ssh-user-keys-for-personal-use-776639793.html) - Sigue las instrucciones a partir del paso 2.

4. A continuación se debe a crear un archivo llamado **config** en la carpeta **.ssh** (donde se crearon las llaves anteriormente). El contenido del archivo debes construirlo **personalizando** la siguiente muestra:

    ```bash
    # Github
    Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github

    # Gitlab
    Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_rsa_gitlab

    # Azure repos
    Host ssh.dev.azure.com
    HostName ssh.dev.azure.com
    IdentityFile ~/.ssh/id_rsa_azurepos
    # Reemplaza con tu cuenta
    User your_msft@account.com
    IdentitiesOnly yes

    # Bitbucket
    Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/id_rsa_bitbucket

    # En caso de tener múltiples cuentas por proveedor
    # Por ejemplo:

    # Github work
    Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github_work
    ```

5. Ya puedes clonar el proyecto que quieras visitando la URL del repositorio y escogiendo la opción SSH. Ten en cuenta lo siguiente:

   * Si sólo tienes una cuenta de ese proveedor:

      ```bash
      git clone URL_SSH

      # Ejemplo
      git clone git@github.com:equilaterus/wikilaterus.git
      ```

    * Si tienes varias cuentas por proveedor, asegúrate de usar el *Host* correcto (de acuerdo a como lo configuraste en el paso anterior):

      ```bash
      # Modifica el host!
      git clone URL_SSH_MODIFICADA

      # Ejemplo para acceder al github work
      git clone git@github.com-work:equilaterus/wikilaterus.git
      ```

Luego de esto, podrás manipular tus repositorios normalmente, sin importar a qué cuenta pertenezcan. La ventaja es que la configuración sólo debes hacerla una vez y de acuerdo al host que utlices durante el comando git clone, **git sabrá que llaves utilizar** para obtener acceso al repositorio con las credenciales correctas.
