#dot_files

This repo provides easy maintenance and transfering of my personal config dot files.

## Transfering
To transfer these dot files to a new system simply perform the following commands:

```
git clone --bare <git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```
If there are no existing conflicting config files, then the files from this repo will be placed in the new systems $HOME directory.

### Note
This readme will also be copied to the $HOME directory. It can safely be deleted, just do not remove it from git tracking.
