#! /bin/bash

# Install LTS node 12.13.1
nvm install "12.13.1"
nvm use "12.13.1"
nvm alias default "12.13.1"
# Install yarn and use yarn exclusively
# Why is all this necessary? See https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/
npm install -g yarn
source "$HOME/.bashrc"
yarn global add yarn
npm rm -g yarn
# Install NPM via yarn and remove the original NPM installed version
yarn global add npm
npm rm -g npm
source "$HOME/.bashrc"

# Install basic global NPM packages via yarn
NPMPKGS=(
"lite-server"
"nodemon"
"prettier"
"neovim"
)
for ((i=0; i<${#NPMPKGS[@]}; ++i)); do
  yarn global add "${NPMPKGS[$i]}"
done

# Display global lists for npm and yarn; yarn should have the above packages while npm should be empty
echo "NPM Global Packages:"
npm ls -g --depth=0
yarn global list

