#!/bin/bash

echo "🔗 Criando links simbólicos..."

# vimrc
ln -sf "$PWD/vimrc" "$HOME/.vimrc"

# autoload
mkdir -p "$HOME/.vim"
ln -sf "$PWD/autoload" "$HOME/.vim/autoload"

mkdir -p "$HOME/.vim/plugged"

echo "✅ Links criados com sucesso!"

