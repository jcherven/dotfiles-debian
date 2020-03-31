#! /bin/bash

function install_nvm {
  # Install Nodejs via NVM
  # https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/
  if [ ! -x "$(command -v nvm)" ]; then
    echo "Installing NVM via Git"
    export NVM_DIR="$HOME/.nvm" && (
      git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
      pushd "$NVM_DIR"
      # Suppress Git's detached HEAD message
      git config advice.detachedHead false
      git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
    ) && \. "$NVM_DIR/nvm.sh"
  fi
}

# Install nvm
install_nvm
# After installation, NVM must be loaded with a new shell
bash --login
echo "NVM has been installed and a new shell has been loaded"
if [ ! -x "$(command -v nvm)" ]; then
  echo "NVM commands aren't in your PATH yet."
  exit 1
else
  # Install LTS nodejs version
  nvm install --lts
  nvm use --lts

  # Install global packages with NPM
  npm -g install \
    prettier \
    neovim \
    jest \
    lite-server \
    nodemon

  # Display global lists for npm
  echo "NPM Global Packages:"
  npm ls -g --depth=0
fi

