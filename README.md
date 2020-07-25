# WPU Theme Features

Add Features to a WordPress Theme

## How to install on your machine

Go to your favorite tools folder :

```
git clone https://github.com/WordPressUtilities/wputhemefeatures
```

Add CLI shortcut :

```
cd wputhemefeatures;_DIR_WPUTHEMEFEATURES=$(pwd);echo "alias wputhemefeatures=\". ${_DIR_WPUTHEMEFEATURES}/wputhemefeatures.sh\"" >> ~/.bash_profile;
```

## How to use

### Install a lazy-loading script.

`wputhemefeatures script lazy;`

### Install a block-moving script.

`wputhemefeatures script move-blocks;`

### Install Vanilla Hybrid-Screens script.

`wputhemefeatures script hybrid;`

### Go to this tool source.

`wputhemefeatures src;`

## Config

You can create a `wputhemefeatures-local.sh` file in this tool root folder to override some settings.

```
#!/bin/bash

_SCRIPTDIR="assets/js/libraries";
```

## Roadmap

- [x] Config file.
- [x] Config path for JS Libs.
- [x] Config to avoid git submodules.
- [x] Find the active theme if called from root.
- [x] Find the active theme if called from a subfolder.
- [ ] Check if a feature is already installed.
- [ ] Load WP-CLI.
- [ ] Self Update.
- [ ] Config file at WordPress root level or one level above.
- [ ] Autocomplete on CLI.

### Scripts

- [x] Install Vanilla hybridscreens.
- [x] Install Vanilla JSU Parallax.
- [x] Install Vanilla Scroll Anims.
- [ ] Install Slick Slider.
- [ ] Install Flickity.
- [ ] Install Masonry.
- [ ] Install twentytwenty.
- [ ] Install Isotope.
- [ ] Load script versions from submodule version tag if available.
- [ ] Create example template for complex scripts.

### New Features

- [x] Create a langage file ( fr_FR.po / es_ES.po ).
- [ ] Override a Parent template.

### Enhancement

- [ ] Use Theme Name instead of Theme ID in .PO files.
