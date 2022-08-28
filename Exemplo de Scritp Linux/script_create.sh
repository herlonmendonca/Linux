#!/bin/bash
 
echo "VERSÃO 1 - ESTE SCRIPT CRIA UMA ESTRUTURA PARA GRUPOS E USUÁRIOS E SETA SUAS PERMISSÕES
excluindo antes os diretorios criados PUBLICO/ GRP_ADM/ GRP_VEN/ GRP_SEC/ e seus usuarios" 

rm -Rf PUBLICO/   
rm -Rf GRP_ADM/
rm -Rf GRP_VEN/
rm -Rf GRP_SEC/
userdel -carlos
userdel -maria
userdel -joao
userdel -debora 
userdel -sebastiana
userdel -roberto
userdel -josefina
userdel -amanda
userdel -rogerio

mkdir PUBLICO/ GRP_ADM/ GRP_VEN/ GRP_SEC/

echo "CRIANDO GRUPOS GRP_ADM, GRP_VEN e GRP_SEC."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "CRIANDO OS USUARIOS DO GRUPO GRP_ADM."

useradd -c "Carlos" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 Senha123456) carlos
useradd -c "Maria" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 Senha123456) maria
useradd -c "Joao" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -6 Senha123456) joao

echo "CRIANDO OS USUARIOS DO GRUPO GRP_VEN."

useradd -c "Debora" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 Senha123456) debora
useradd -c "Sebastiana" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 Senha123456) sebastiana
useradd -c "Roberto" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -6 Senha123456) roberto

echo "CRIANDO OS USUARIOS DO GRUPO GRP_SEC."

useradd -c "Josefina" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 Senha123456) josefina
useradd -c "Amanda" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 Senha123456) amanda
useradd -c "Rogerio" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -6 Senha123456) rogerio

echo "Dando permissão total ao dono root, dando permissão total aos usuarios do grupo e excluindo a permissão de leitura, escrita e execução de outros."

chmod 770 GRP_ADM/ GRP_VEN/ GRP_SEC/

echo "Dando permissão total para o diretório publico."
chmod 777 publico/

#na proxima versão, este script deverá ser automatizado realizando perguntas para o operador"