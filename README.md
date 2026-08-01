# Utility

## Installation

To install on macOS, run the following commands in Terminal:
```
mkdir -p ~/bin
cd ~/bin
git clone git@github.com:caleb-james-smith/Utility.git
ln -s Utility/scripts/* .
```

Make sure that your `~/bin` directory is in your `PATH`.
For example, on macOS, you can add this line to `~/.bash_profile`:
```
export PATH="$HOME/bin:$PATH"
```
Then, you can `source ~/.bash_profile`:
```
source ~/.bash_profile
```

## Vim

There are custom colorschemes for Vim [here](https://github.com/flazz/vim-colorschemes);
I use the custom delek colorscheme from this repository.

**Important:** The delek colorscheme from this repository is *significantly* different than the default version from Vim!
I have often run into an annoying white background issue when using the main version of delek from Vim on dark background terminals.

Run the following commands to install the colorscheme repository:
```
mkdir -p ~/.vim
cd ~/.vim
git clone https://github.com/flazz/vim-colorschemes.git
rsync -az vim-colorschemes/colors .
```

Then, Vim should load the custom version of delek (for example, `~/.vim/colors/delek.vim`)
instead of the default version (for example, `/usr/share/vim/vim91/colors/delek.vim`),
which should fix the white background issue for dark background terminals.

## Using scripts

The script `search_word_docs.sh` searches all MS Word documents in the current directory for a text pattern. 
In each Word file, the script searches the body, footnotes, endnotes, etc. for the pattern.
The script unzips each Word file and then greps the xml files to search for the pattern.
```
search_word_docs.sh pattern
```

The script `rename_files.sh` adds a prefix to a set of files.
The user should provide an input directory, a file extension, and a prefix as arguments.
The script will rename matching files (using mv), adding the prefix to the beginning of the file names.
```
rename_files.sh directory extension prefix
```
Example:
```
rename_files.sh oll_algorithms_v1 png oll_
```

