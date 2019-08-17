# Install Chocolatey
In admin cmd prompt, run:

`@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"`

# Install Packages

## Chocolatey

`choco install ag autohotkey git neovim firacode nodejs python3`

## Pip

`pip install --user --upgrade pynvim python-language-server Send2Trash`

## Npm

`npm install -g typescript typescript-language-server`


# Install fvim

[Releases Page](https://github.com/yatli/fvim/releases)

Then add to `PATH`

# Install Powerline Hack font

[Powerline Hack Font](https://github.com/powerline/fonts/tree/master/Hack)

# SSH Key Auth

## Easy Way
Enable the `OpenSSH Authentication Agent` Service that is packaged with Windows10

## Less Easy Way

* Download latest [release](https://github.com/PowerShell/Win32-OpenSSH/releases) of OpenSSH for Windows:

* Extract and copy out to Program Files or somewhere logical

* Add the folder to PATH

* With an Administrator PowerShell prompt, execute `install-sshd.ps1`

* Then, enable the service

## Shared

Generate a key:
`ssh-keygen -t rsa`

Add the key to the now-running ssh-agent:
`ssh-add ~/.ssh/id_rsa`

Copy the pub key out to Git servers:
`clip < ~/.ssh/id_rsa.pub`


# Clone dotfiles repo
`mkdir ~/Source`

`cd ~/Source`

`git clone https://github.com/jjohnson338/dotfiles.git`

`mv ~/Source/dotfile/.git ~`

`cd ~ && git checkout .`

# Create stub init.vim to load existing nvim init
C:/Users/Jared/AppData/Local/nvim/init.vim

```
source ~/.config/nvim/init.vim
```
# Create stub ginit.vim to load existing nvim ginit
C:/Users/Jared/AppData/Local/nvim/init.vim

```
source ~/.config/nvim/ginit.vim
```

# Remap Caps Lock to do something useful

Add a Startup Task in Task Scheduler that launches
`~/.config/Windows/capslock-ctrlescape.ahk` on system startup (probably have to use full path)

This script remaps the `CapsLock` key to `Escape` when pressed by itself, and `Ctrl` when pressed in combination with another key
