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
For example, on macOS, you can add this line to `~/.bash_profile` (replace <user_name> with your user name):
```
export PATH="/Users/<user_name>/bin:$PATH"
```
Then, you can `source ~/.bash_profile`:
```
source ~/.bash_profile
```

## Using scripts

The script `search_word_docs.sh` searches all MS Word documents in the current directory for a text pattern. 
In each Word file, the script searches the body, footnotes, endnotes, etc. for the pattern.
The script unzips each Word file and then greps the xml files to search for the pattern.
```
search_word_docs.sh SomePattern
```

