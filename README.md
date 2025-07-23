# Configuração do Vim - vim-config

Este repositório contém minha configuração personalizada do Vim, com plugins gerenciados via [vim-plug](https://github.com/junegunn/vim-plug), organizada para ser replicável em Linux e Windows.

---

## 📁 Estrutura
vim-config/
├── autoload/
│ └── plug.vim
├── vimrc
├── setup.sh # Instalação no Linux/macOS
├── setup.bat # Instalação no Windows
└── .gitignore

## 📦 Plugins

- [NERDTree](https://github.com/preservim/nerdtree)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [coloresque](https://github.com/ObserverOfTime/coloresque.vim)
- [vimade](https://github.com/TaDaa/vimade)
- [TabNine](https://github.com/codota/tabnine-nvim)

---

## 🐧 Instalação no Linux/macOS

```bash
git clone https://github.com/seu-usuario/vim-config.git ~/Documentos/vim-config
cd ~/Documentos/vim-config
bash setup.sh

## 🪟 Instalação no Windows

git clone https://github.com/seu-usuario/vim-config.git %USERPROFILE%\vim-config
cd %USERPROFILE%\vim-config
setup.bat

## ✨ Após instalar, abra o Vim e rode:
```bash
:PlugInstall
```
-- Isso instalara todos os plugins 

```bash
#!/bin/bash

echo "🔗 Criando links simbólicos..."

# vimrc
ln -sf "$PWD/vimrc" "$HOME/.vimrc"

# autoload
mkdir -p "$HOME/.vim"
ln -sf "$PWD/autoload" "$HOME/.vim/autoload"

echo "✅ Links criados com sucesso!"
Torne executável com:
```
chmod +x setup.sh
```

```









