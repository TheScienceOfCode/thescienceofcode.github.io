# The Science of Code

A Free and Open Source community.

Published at: https://thescienceofcode.com/

## Current setup

The site now runs on `hugoplate` with local overrides under `layouts/` to keep the current `content/post` structure and existing article front matter.

### Local prerequisites

1. Install `go`.
2. Install the theme dependencies:

   ```bash
   cd themes/hugoplate
   npm install
   ```

3. Download Hugo `0.158.0` extended into:

   ```text
   .tools/hugo-0.158.0/hugo
   ```

### Run locally

Use the helper script from the repo root:

```bash
./run-dev.sh
```

That starts Hugo in draft mode (`server -D`) with the required `PATH` and `HUGO_CACHEDIR`.
If `assets/css/generated-theme.css` is missing, the script generates it automatically before starting.

If you want to pass custom Hugo arguments, they are forwarded directly:

```bash
./run-dev.sh --navigateToChanged
./run-dev.sh server --disableFastRender
```

If you need to force regeneration of the generated theme tokens:

```bash
./run-dev.sh --force-theme-css
```

Open: `http://localhost:1313/`

### Build once

```bash
PATH="$PWD/themes/hugoplate/node_modules/.bin:$PATH" \
HUGO_CACHEDIR="$PWD/.hugo_cache" \
./.tools/hugo-0.158.0/hugo
```

## Legacy tranquilpeak

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
   hugo serve -D
   ```

   If you are using Powershell:

   ```
   .\hugo serve -D
   ```

The Science of Code is a Free and Open Source initiative by [Equilaterus](https://equilaterus.com).
