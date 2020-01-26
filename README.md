Vim plugin for creating a Sourcegraph url directly from Vim.

## Usage
In Vim, run `:SourcegraphCopyUrl` on a line or while visually selecting multiple
lines. This will use echomsg to print the url to the screen and copy the text to
your clipboard. Previous urls can be seen by running `:messages`.

## Setup
Using [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'patoconnor43/sourcegraph-vim'
```
