# Install Chocolatey
In admin cmd prompt, run:

`@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"`

# Install Packages
Git `choco install git`

Neovim `choco install neovim`

Fira Code `choco install firacode`

Ag `choco install ag`

NodeJS `choco install nodejs`

Python3 `choco install python3`

NodeJS Packages `npm install -g typescript typescript-language-server`

pynvim (for deoplete): `pip3 install --user --upgrade pynvim`

python-language-server: `pip install python-language-server`

Send2Trash: `pip install Send2Trash`

# Install fvim

[Releases Page](https://github.com/yatli/fvim/releases)

Then add to `PATH`

# Install Powerline Hack font

[Powerline Hack Font](https://github.com/powerline/fonts/tree/master/Hack)


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
