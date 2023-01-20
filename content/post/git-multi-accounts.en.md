---
title: "Multiple git accounts"
url: "multiple-git-accounts"
titleHtml: "<small>How to configure</small><br><b>multiple git accounts</b>"
license: ccby4.0
author: Daniel Cañizares
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

Configure your machine to use **GitHub**, **Gitlab**, **Azure Repos** and **Bitbucket** accounts simultaneously with **git**. 
<!--more-->

This guide explains how to configure your machine to access multiple **git** repositories, using different credentials between them, **without requiring to login and logout from those accounts constantly**. Applies for both **Linux** and **Windows** (though you can replicate the Linux steps on *Mac*). It has no limits regarding the number of accounts per provider.

If you use Github Desktop, you can [check this easier guides](https://github.com/desktop/desktop/tree/development/docs/integrations) .

> You can have a single account configured as usual but use this method to integrate additional accounts. For example, if you are already using GitHub, you only need to follow this procedure for the extra accounts that you are going to work with.


## Pre-requisites

Git is installed and you understand its basic functioning.


## Steps

1. Go to the following path (*if the folder **.ssh** does not exists, create it*):

   ```bash
   # Linux
   ~/.ssh
  
   # Windows 
   C:\users\USER_NAME\.ssh
   ```

2. Create a new ssh key. *Important:* When the asked for a passphrase, if you are on a safe machine, you can press ENTER and leave the key without a passphrase. By doing that, you will avoid the requirement to type the passphrase constantly (or needing to configure the ssh-agent, by default).

   ```bash
   # Linux
   ssh-keygen -t rsa -b 4096

   # Windows 
   ssh-keygen.exe

   # Filename example:
   file name: id_rsa_gitlab
   # Follow the process...
   ```

   For the filename, it is recommended to use something descriptive as: **id_rsa_[PROVIDER]_[ACCOUNT]**. Where:
   * **PROVIDER** can be *github*, *gitlab*, *azurerepos*, etc. 
   * **ACCOUNT** (optional) could be used in case of having more than one account per **PROVIDER**. 
   * For example: 
     * **id_rsa_github**
     * **id_rsa_github_work**
   
3. Finishing the previous steps, you will see two files, one of them with extension **.pub** (public). Open the file and copy all its contents to add a new key to your respective git provider:

    * [Add a new SSH key on Github](https://help.github.com/es/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

    * [Add a new SSH key on Gitlab](https://www.tutorialspoint.com/gitlab/gitlab_ssh_key_setup.htm) - Follow the guide starting from step 2.

    * [Add a new SSH key on Azure Repos](https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops&tabs=current-page) - Follow the guide starting from step 2.

    * [Add a new SSH key on Bitbucket](https://confluence.atlassian.com/bitbucketserver/ssh-user-keys-for-personal-use-776639793.html) - Follow the guide starting from step 2.

4. Next, you must create a file named **config** located in the folder **.ssh** (where you previously created the keys). The file contents must be filled **customizing** the following sample:

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
    # Replace with your account
    User your_msft@account.com
    IdentitiesOnly yes

    # Bitbucket
    Host bitbucket.org
    HostName bitbucket.org
    User git
    IdentityFile ~/.ssh/id_rsa_bitbucket

    # In case that you have multiple accounts per provider
    # For example:

    # Github work
    Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github_work
    ```

5. Now you can clone the project that you want, browsing into the repository URL ans selecting the option SSH. Keep in mind that:

   * If you only have one account per provider:

      ```bash
      git clone URL_SSH

      # Example
      git clone git@github.com:equilaterus/wikilaterus.git
      ```

    * If you have multiple accounts per provider, be sure to use the correct *Host* (reviewing the set-up done in the previous step):

      ```bash
      # Modify the host!
      git clone URL_SSH_MODIFIED

      # Example for github work
      git clone git@github.com-work:equilaterus/wikilaterus.git
      ```

We have finished! Now you can work normally on your git repos, no matter the user account. The advantaje is that this configuration is done only once and according to the host that you use during a *git clone*, **GIT will know which set of keys it needs to use** to obtain access to the repo with a correct user account.
