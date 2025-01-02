#!/bin/bash

# Variáveis
CONFIG_DIR=".config"
HUSKY_DIR="$CONFIG_DIR/husky"
COMMITLINT_CONFIG="$CONFIG_DIR/commitlint.config.js"

echo "Configurando Husky e Commitlint..."

# Inicializar o projeto, caso não tenha package.json
if [ ! -f "package.json" ]; then
    echo "Criando package.json..."
    npm init -y
fi

# Criar a pasta de configuração oculta, se não existir
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Criando pasta de configuração oculta: $CONFIG_DIR"
    mkdir -p "$CONFIG_DIR"
fi

# Instalar dependências necessárias
echo "Instalando dependências Husky e Commitlint..."
npm install --save-dev husky @commitlint/cli @commitlint/config-conventional

# Inicializar Husky
echo "Inicializando Husky..."
npx husky install

# Mover a pasta .husky para .config/husky
if [ -d ".husky" ]; then
    echo "Movendo a pasta .husky para $HUSKY_DIR"
    mv .husky "$HUSKY_DIR"
fi

# Atualizar script prepare para apontar para o novo diretório
echo "Atualizando o script prepare no package.json..."
npx json -I -f package.json -e "this.scripts.prepare=\"husky install $HUSKY_DIR\""

# Configurar o hook commit-msg no novo diretório
echo "Configurando hook commit-msg no Husky..."
npx husky add "$HUSKY_DIR/commit-msg" "npx --no-install commitlint --edit \$1"

# Configurar Commitlint
if [ ! -f "$COMMITLINT_CONFIG" ]; then
    echo "Criando configuração Commitlint em $COMMITLINT_CONFIG..."
    cat <<EOL >"$COMMITLINT_CONFIG"
module.exports = {
  extends: ['@commitlint/config-conventional'],
};
EOL
fi

# Incluir a pasta de configuração no package.json (opcional)
if ! grep -q '"commitlint"' package.json; then
    echo "Adicionando referência ao Commitlint no package.json..."
    npx json -I -f package.json -e 'this.commitlint={extends:["./.config/commitlint.config.js"]}'
fi

# Finalizar
echo "Configuração concluída!"
echo "Husky foi configurado para usar hooks na pasta $HUSKY_DIR."
echo "A configuração do Commitlint está em $CONFIG_DIR."
