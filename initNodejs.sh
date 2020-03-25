#! /bin/bash

# Install LTS nodejs version
nvm install --lts
nvm use --lts

# # Install yarn and use yarn exclusively
# # Why is all this necessary? See https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/
# npm install -g yarn
# source "$HOME/.bashrc"
# yarn global add yarn
# npm rm -g yarn
# # Install NPM via yarn and remove the original NPM installed version
# yarn global add npm
# npm rm -g npm
# source "$HOME/.bashrc"

# Install global packages with NPM
NPMPKGS=(
  "yarn"
  "lite-server"
  "nodemon"
  "prettier"
  "neovim"
)
for ((i=0; i<${#NPMPKGS[@]}; ++i)); do
  npm -g install "${NPMPKGS[$i]}"
done

# Display global lists for npm and yarn; yarn should have the above packages while npm should be empty
echo "NPM Global Packages:"
npm ls -g --depth=0

