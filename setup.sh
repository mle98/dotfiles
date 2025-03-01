scriptname=$(basename "$0")
runmode=$1
echo "executing the script in mode $1"

function execute() {
        commandtype=$1
        shift
        echo "executing $@"
        if [[ "$runmode" == "$commandtype" ]]; then
                "$@"
        fi
}

newuser='mat'

execute root yum update -y
execute root yum install -y epel-release sudo zsh git wget mlocate procps gcc unzip which zlib-devel openssl-devel tree
execute root yum install -y xclip
execute root useradd -m -s /bin/zsh $newuser
execute root usermod -aG wheel $newuser
execute root /usr/bin/zsh -c "echo \"$newuser ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/\"$newuser\""
execute root /usr/bin/zsh -c "mv $scriptname /home/$newuser"
execute root chown "$newuser":"$newuser" /home/"$newuser"/"$scriptname"
execute root su mat

execute user git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
execute user ~/.fzf/install --key-bindings --completion --no-update-rc
execute user /usr/bin/zsh -c 'curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | zsh'
execute user /usr/bin/zsh -c 'curl -fsSL https://pyenv.run | zsh'
execute user /usr/bin/zsh -c 'curl -fsSl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh'
execute user wget https://github.com/mle98/dotfiles/archive/master.tar.gz
execute user tar xf master.tar.gz
execute user cp dotfiles-main/.* .
execute user rm -drf dotfiles-main
execute user rm master.tar.gz
execute user mkdir programs
execute user cd programs
execute user wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
execute user tar -xf nvim-linux-x86_64.tar.gz
execute user rm nvim-linux-x86_64.tar.gz
execute user sudo ln -s ~/programs/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
execute user wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
execute user tar -xf ripgrep*
execute user rm ripgrep*.tar.gz
execute user sudo ln -s ~/programs/ripgrep-14.1.1-x86_64-unknown-linux-musl/rg /usr/local/bin/rg
execute user wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-gnu.tar.gz
execute user tar -xf fd*.tar.gz
execute user rm fd*.tar.gz
execute user sudo ln -s ~/programs/fd-v10.2.0-x86_64-unknown-linux-gnu/fd /usr/local/bin/fd
execute user wget https://github.com/jesseduffield/lazygit/releases/download/v0.48.0/lazygit_0.48.0_Linux_x86_64.tar.gz
execute user tar -xf lazygit*.tar.gz
execute user sudo ln -s ~/programs/lazygit /usr/local/bin/lazygit
execute user rm LICENSE README.md lazygit*.tar.gz
execute user sudo mkdir -p /usr/lib/jvm
execute user wget https://download.java.net/java/GA/jdk23.0.1/c28985cbf10d4e648e4004050f8781aa/11/GPL/openjdk-23.0.1_linux-x64_bin.tar.gz
execute user tar -xf openjdk*.tar.gz
execute user rm openjdk*.tar.gz
execute user sudo mv jdk-23.0.1 /usr/lib/jvm
execute user sudo alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-23.0.1/bin/java 1
execute user source "$HOME/.zshrc"
execute user pyenv install 3.13
execute user pyenv global 3.13
execute user mkdir "$HOME"/.config
execute user cd "$HOME"/.config
execute user wget https://github.com/mle98/kickstart.nvim/archive/master.tar.gz
execute user tar xf master.tar.gz
execute user mv kickstart.nvim-master nvim
execute user rm master.tar.gz
execute user echo ' --------------------------------------------------------------please type in your git username----------------------------------------------------------------------'
execute user read gituser
execute user echo '---------------------------------------------------------------please type in your git email----------------------------------------------------------------------'
execute user read gitemail
execute user git config --global user.email $gitemail
execute user git config --global user.name $gituser
execute user echo '--------------------------------------------------------------------------------------------------------------'
execute user echo 'This concludes the automatic setup. Please create a completely fresh session and log in again. The t wo last steps you need to to are to import your SSH keys and to execute nvim.'
execute user echo '--------------------------------------------------------------------------------------------------------------'
