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


## Installation via Package Manager

Your can install the plugin with a package Manager, i.e., [Pathogen](https://github.com/tpope/vim-pathogen), [NeoBundle](https://github.com/Shougo/neobundle.vim), or [Plug](https://github.com/junegunn/vim-plug) should work

For example with [Plug](https://github.com/junegunn/vim-plug) add the following `Plug` line between the `begin` and `end` call:
```vim
call plug#begin()
... 
Plug 'lifepillar/vim-formal-package', {'do': './convert_to_plugin.sh'}
...
call plug#end()
```