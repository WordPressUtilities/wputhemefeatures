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

### Install Vanilla Hybrid-Screens script.

`wputhemefeatures script hybrid;`

## Config

You can create a `wputhemefeatures-local.sh` file in this tool root folder to override some settings.

```
#!/bin/bash

_SCRIPTDIR="assets/js/libraries";
```

## Roadmap

- [x] Config file.
- [x] Config path for JS Libs.
- [ ] Load WP-CLI.
- [ ] Find the active theme if called from root.
- [ ] Find the active theme if called from a subfolder.
- [ ] Self Update.
- [ ] Config to avoid git submodules.
- [ ] Config file at WordPress root level or one level above.
- [ ] Autocomplete on CLI.

### Scripts

- [x] Install Vanilla hybridscreens.
- [ ] Install Vanilla JSU Parallax.
- [ ] Install Vanilla Scroll Anims.
- [ ] Install Slick Slider.
- [ ] Install Flickity.
- [ ] Install Masonry.
- [ ] Install twentytwenty.
- [ ] Install Isotope.
- [ ] Load script versions from submodule version tag if available.
- [ ] Create example template for complex scripts.

### New Features

- [ ] Create a langage file ( fr_FR.po / es_ES.po ).
- [ ] Copy Parent template.
