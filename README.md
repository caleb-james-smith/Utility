# Utility

Installation:
```
mkdir -p ~/bin
cd ~/bin
git clone git@github.com:caleb-james-smith/Utility.git
ln -s Utility/scripts/* .
```

The script `search_word_docs.sh` searches all MS Word documents in the current directory for a text pattern. 
In each Word file, the script searches the body, footnotes, endnotes, etc. for the pattern.
The script unzips each Word file and then greps the xml files to search for the pattern.
```
./search_word_docs.sh SomePattern
```

