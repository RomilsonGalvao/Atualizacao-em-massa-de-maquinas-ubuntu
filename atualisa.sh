#!/bin/bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LOG_DIR=/home/log
# Função para obter a data e hora atual
get_current_datetime() {
    date +"%Y-%m-%d %H:%M:%S"
}
exec &>> "$LOG_DIR/log_do_crontab.log"
echo "$(get_current_datetime) - Script iniciado com sucesso!" >> "$LOG_DIR/inicio_de_script_log.txt"
# Configurações
usuario_remoto="root"
endereco_remoto="ip da maquina server"
pasta_raiz_monitorada="/atualizacao"

# Lista de arquivos na pasta raiz remota
arquivos_remotos=($(ssh "$usuario_remoto@$endereco_remoto" "find $pasta_raiz_monitorada -type f"))

# Caminho absoluto do diretório atual
caminho_absoluto_destino="/"

# Copia arquivos para a estrutura de diretórios local
for arquivo_remoto in "${arquivos_remotos[@]}"; do
    # Extrai a estrutura de diretórios relativa à pasta raiz
    estrutura_diretorios_relativa="${arquivo_remoto#$pasta_raiz_monitorada/}"

    # Determina o diretório de destino local
    diretorio_destino_local="$caminho_absoluto_destino$estrutura_diretorios_relativa"

    # Cria os diretórios locais, se necessário
    mkdir -p "$(dirname "$diretorio_destino_local")"

    # Copia o arquivo da máquina remota para o diretório local
    scp -p "$usuario_remoto@$endereco_remoto:$arquivo_remoto" "$diretorio_destino_local"

    echo "$(get_current_datetime) - Arquivo copiado: $arquivo_remoto para $diretorio_destino_local"
done
echo "$(get_current_datetime) - Script concluído com sucesso!" >> "$LOG_DIR/final_de_script_log.txt"