# The Science of Code

A Free and Open Source community.

Published at: https://thescienceofcode.com/

## Quick start

1. Pre-requisites:
   * Extract Hugo Binaries into the project's root folder.
     * [Recommended 0.120.3](https://github.com/gohugoio/hugo/releases/tag/v0.120.3)
     * [Fallback version 0.53](https://github.com/gohugoio/hugo/releases/tag/v0.53) 
   * [Install NodeJS](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
   * Recommended **Github Desktop**: 
     * [Linux](https://github.com/shiftkey/desktop)
     * [Win and mac](https://desktop.github.com/) 

2. Clone the repo. **Note**: the theme is contained on a Git Submodule. If you're using Github desktop just clone this repo and it will download the submodule automatically. 

    If you're going to modify the theme, you can add the submodule as a repo to Github Desktop (*Add existing repository* > location ./theme/tranquilpeak) and commit changes directly into the theme repository.

2. Download the repo and install dependencies for the theme:

   ```
   cd themes/tranquilpeak
   npm install -g grunt-cli
   npm install
   ```

   

3. Run theme (if you plan to actively edit it):

   ```
   cd themes/tranquilpeak
   npm start
   ``` 

   Otherwise, just build it!

   ```
   cd themes/tranquilpeak
   npm run build
   ``` 

4. Run the site (using another terminal):

   ```
   hugo server -D
   ```

The Science of Code is a Free and Open Source initiative by [Equilaterus](https://equilaterus.com).
