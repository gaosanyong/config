Run below commands to link bash setup

```
cd
ln -s ~/.config/bash/bash_alias .bash_alias
ln -s ~/.config/bash/bash_function .bash_function
ln -s ~/.config/bash/bash_profile .bash_profile
ln -s ~/.config/bash/bashrc .bashrc
ln -s ~/.config/bash/inputrc .inputrc

ln -s ~/.config/vim/vimrc .vimrc

ln -s ~/.config/tmux/tmux.conf .tmux.conf
mkdir ~/.tmux
ln -s ~/.config/tmux/themes .tmux/themes

ln -s ~/.config/oh-my-posh/themes ~/.themes
```

When only specific configurations are needed, you can use Git's sparse checkout feature to download a fraction of a repository. For example, if a local workspace only requires the nvim directory and the README.md file, sparse checkout allows you to pull those exclusively.

```
mkdir .config
git init
git remote add -f origin https:/github.com/gaosanyong/config
git sparse-checkout init --cone
git sparse-checkout set nvim
git sparse-checkout add README.md --skip-checks
git pull origin master
```
