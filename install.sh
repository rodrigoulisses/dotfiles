sudo apt-get install libvips make curl git libssl-dev gcc

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# Add ruby plugin
echo \". "$HOME/.asdf/asdf.sh"\" >> ~/.zshrc
source ~/.zshrc

asdf plugin add ruby
asdf install ruby 3.2.2
