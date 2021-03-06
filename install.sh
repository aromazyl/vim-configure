# download ctags
wget https://nchc.dl.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz
tar -xf ctags-5.8.tar.gz

# install ctags
cd ctags-5.8 && ./configure --prefix=$HOME/local/ctags/ && make && make install
echo 'export PATH=$PATH:$HOME/local/ctags/bin/' >> ~/.bashrc
cd ..

#download vundle and install
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/
source ~/.bashrc
vim -E -c PlugInstall -c q
