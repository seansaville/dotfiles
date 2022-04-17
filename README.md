# dotfiles

My dotfiles.

## Install

Make a bare clone of this repo:

```
git clone --bare https://github.com/seansaville/dotfiles.git $HOME/.dotfiles
```

Define an alias for convenience:

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Check out everything that isn't a documentation file:

```
dotfiles checkout HEAD ".*"
```
