VIM Plugins
===========

This git repo contains the vim plugins and configuration I like to use. I may
update it at any time, so clone at your own risk.

vimrc is included here mainly because it has settings for the plugins, so they
kinda belong together.

Setup/Maintenance
-----------------

Install:

    cd
    git clone --recurse-submodules https://github.com/ggruen/vim.git .vim

Update:

    git pull
    git submodule update --remote

If you install/remove a plugin, update the appropriate section below to keep
your sanity.

If you're on a Mac, you may need to install Exuberant ctags (e.g. with
[Homebrew](https://brew.sh) for ShowFunc to work:

    brew install ctags

Submodules
----------

- CtrlP:                https://github.com/ctrlpvim/ctrlp.vim.git
- Syntastic:            https://github.com/vim-syntastic/syntastic.git
- VIM Multiple Cursors: https://github.com/terryma/vim-multiple-cursors.git

Downloads (stored locally in this repo)
---------------------------------------

- acp:      http://www.vim.org/scripts/script.php?script_id=1879
- showfunc: https://vim.sourceforge.io/scripts/script.php?script_id=397

Notes
-----

If you find something breaking on a particular machine, do this in vimrc (from
http://matthewhutchinson.net/2011/12/21/conditional-vimrc-configs):

	" get hostname
	let machine = substitute(system('hostname'), "\n", "", "")
	" auto strip whitespace when saving
	" don't auto strip on these machines
	if machine !~ "[calcifer|alderann]"
	  autocmd BufWritePre * :%s/\s\+$//e
	endif

