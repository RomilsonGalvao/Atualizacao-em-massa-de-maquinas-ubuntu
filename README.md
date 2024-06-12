# Atualização em massa de maquinas ubuntu
 atualisa todas mas maquinas de uma empresssa de uma unica ves apartir de uma maquina central

AUTORIZAR MAQUINA A FAZER ATUALIZAÇÃO AUTOMATICA
OBS: COPIAR LINHA POR LINHA
ssh-keygen -t rsa -b 2048
/root/.ssh/id_rsa
EM SEGUIDA NÃO INFORMAR SENHA NENHUMA, APENAS ENTER, ENTER.

APARECERA ISSO NA TELA.
The key fingerprint is:
SHA256:Gl/GhG4imtL2HXO1qk0OYSuzDRMIFo1l/+5TzgU3hEk root@TIC-CP000000
The key's randomart image is:
+-----[teste]-----+
| .+o    .Er      |
| .w..    - .     |
|..   .  . o      |
|.. .  .. + o     |
|  . o =.y B .    |
| . o +.O = o     |
|. = = *.c o s    |
| O . O.w +  ad   |
|    o +0=da      |
+----[teste]------+
DEPOIS COPIE A ULTIMA LINHA
ssh-copy-id root@"ipa da maquina server"
INFORME A SENHA "senha root da maquina" 

FIM

ESTA CONFIGURADO PARA ATUALIZAÇÃO AUTOMATICA.

OBS2: O DIRETORIO DE NA QUAL ATUALIZA A MAQUINA FICA NO IP:172.16.203.56 NA RAIZ /
E DEVE CONTER TODAS A ESTRUTURA DE PASTA DA QUAL O ARQUIVO PERTENCE.

O SCRIPT atualização.sh DEVE SER COLOCADO USANDO O COMANDO crontab -e
@reboot sleep 10 && /caminho/do/atualiza.sh

ADCIONHAR NO INICIO DO crontab -e
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DATE="$(date +\%Y\%m\%d\%H\%M\%S)"