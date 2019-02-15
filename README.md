vim
===

Clone and pull the repo using `--recurse-submodules` to get all packages.

Replace (or merge) your ~/.vim folder with the contents of this repository.

Put the following line in ~/.vimrc:

    runtime vimrc


package management with vim 8
-----------------------------

Copied from https://shapeshed.com/vim-packages/

### adding a package ###

Here is an example of how to add a package using Vim’s native approach to packages and git submodules.

    cd ~/dotfiles
    git submodule init
    git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/shapeshed/start/vim-airline
    git add .gitmodules vim/pack/shapeshed/start/vim-airline
    git commit

### updating packages ###

To update packages is also just a case of updating git submodules.

    git submodule update --remote --merge
    git commit

### removing a package ###

Removing a package is just a case of removing the git submodule.

    git submodule deinit vim/pack/shapeshed/start/vim-airline
    git rm vim/pack/shapeshed/start/vim-airline
    rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
    git commit
