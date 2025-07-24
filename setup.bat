@echo off
if not exist "%USERPROFILE%\vimfiles\" (
    mkdir "%USERPROFILE%\vimfiles\"
)


echo Criando links para configuração do Vim...

:: Cria link simbólico para _vimrc
mklink %USERPROFILE%\_vimrc %USERPROFILE%\vim-config\vimrc

:: Cria diretório .vim se não existir
IF NOT EXIST %USERPROFILE%\.vim (
    mkdir %USERPROFILE%\.vim
)

:: Cria link simbólico para autoload
mklink /D %USERPROFILE%\.vim\autoload %USERPROFILE%\vim-config\autoload

echo Criando a pasta Plugged 
if not exist "%USERPROFILE%\vimfiles\plugged\" (
    mkdir "%USERPROFILE%\vimfiles\plugged\"
)

echo Links criados com sucesso!
echo Configuraçao concluida
pause

