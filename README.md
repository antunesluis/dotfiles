# My dotfiles

This directory contains the dotfiles for my system

/home/antunesluis/Downloads/Captura de tela de 2024-02-27 12-56-21.png

/home/antunesluis/Downloads/Captura de tela de 2024-02-27 12-56-08.png

## Requirements

Ensure you have the following installed on your system

### Git

```
$ sudo apt install git
```

### Stow

```
$ sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/antunesluis/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
