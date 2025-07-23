@echo off
echo Criando links para configuração do Vim...

:: Cria link simbólico para _vimrc
mklink %USERPROFILE%\_vimrc %USERPROFILE%\vim-config\vimrc

:: Cria diretório .vim se não existir
IF NOT EXIST %USERPROFILE%\.vim (
    mkdir %USERPROFILE%\.vim
)

:: Cria link simbólico para autoload
mklink /D %USERPROFILE%\.vim\autoload %USERPROFILE%\vim-config\autoload

echo Links criados com sucesso!
pause

