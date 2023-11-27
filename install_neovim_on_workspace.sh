sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim/
git checkout stable
git pull
git checkout stable
rm -r build/  # clear the CMake cache
rm -fr build/
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
echo 'export PATH="$HOME/neovim/bin:$PATH"' >> $HOME/.bashrc
