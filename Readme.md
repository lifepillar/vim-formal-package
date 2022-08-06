# Vim support for formal languages

A package containing Vim plugins supporting various formal languages.

Currently supported:

- [CryptoVerif](https://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/)
- [EasyCrypt](https://www.easycrypt.info)
- [Maude](http://maude.cs.illinois.edu)
- [ProVerif](https://prosecco.gforge.inria.fr/personal/bblanche/proverif/)
- [Tamarin Prover](https://tamarin-prover.github.io/)
- [Verifpal](https://verifpal.com/)

**NOTE:** all of these plugins are still under development and some of them are
still incomplete!


## Installation as a Vim package

```
cd ~/.vim
mkdir -p pack
git clone https://github.com/lifepillar/vim-formal-package pack/formal
```

## Installation via Package Manager

Your can install the plugin with a package Manager, i.e., [Pathogen](https://github.com/tpope/vim-pathogen), [NeoBundle](https://github.com/Shougo/neobundle.vim), or [Plug](https://github.com/junegunn/vim-plug) should work

For example, with [Plug](https://github.com/junegunn/vim-plug) add the following `Plug` line between the `begin` and `end` call:

```vim
Plug 'lifepillar/vim-formal-package' { dir: 'pack/formal' }
```

If you prefer to organize the files as in a single plugin (all autoload files in the `autoload` folder, all ftplugin files in the `ftplugin` folder, etc.), a script called `convert_to_plugin.sh` is provided to perform the conversion. It can be used as follows:

```vim
Plug 'lifepillar/vim-formal-package', {'do': './convert_to_plugin.sh'}
```
