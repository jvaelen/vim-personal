# About

This repository contains my personal .vim folder (as a way to synchronize plugins between machines or to share with other people).
NOTE: Not all plugins I use are submodules. Some (e.g. YouCompleteMe) require an installation on every machine. These modules are listed in .gitignore.

# Adding new plugins as submodules

Plugins that are just a cloned git repository can be installed as a submodule so that they can be synchronized. To install a new submodule:
    
    cd ~/.vim/bundle
    git submodule add <url>
    git add <bundle>
    git commit -m "Added bundle <bundle name>."

# Installation

    cd ~
    git clone https://github.com/jvaelen/vim-personal.git .vim
    cd .vim
    git submodule update --init

# Thanks to

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
