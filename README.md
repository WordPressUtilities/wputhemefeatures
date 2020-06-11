# WPU Theme Features

Add Features to a WordPress Theme

## How to install on your machine

Go to your favorite tools folder :

```git clone https://github.com/WordPressUtilities/wputhemefeatures```

```cd wputhemefeatures;_DIR_WPUTHEMEFEATURES=$(pwd);echo "alias wputhemefeatures=\". ${_DIR_WPUTHEMEFEATURES}/wputhemefeatures.sh\"" >> ~/.bash_profile;```

## How to use

### Install a lazy-loading script.

`wputhemefeatures script lazy;`

### Install Vanilla Hybrid-Screens script.

`wputhemefeatures script hybrid;`

## Roadmap

- [x] Install Vanilla hybridscreens.
- [ ] Install Vanilla JSU Parallax.
- [ ] Install Vanilla Scroll Anims.
- [ ] Install Slick Slider.
- [ ] Find the active theme if called from root.
- [ ] Find the active theme if called from a subfolder.
- [ ] Self Update.
- [ ] Config file.
- [ ] Config path for JS Libs.
- [ ] Config to avoid git submodules.
- [ ] Load script versions from submodule version tag if available.
- [ ] Autocomplete on CLI.
- [ ] Create a langage file ( fr_FR.po / es_ES.po ).
