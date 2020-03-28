#! /bin/bash

# Install LTS nodejs version
nvm install --lts
nvm use --lts

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

