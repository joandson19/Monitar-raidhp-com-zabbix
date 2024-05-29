# Baixe o pacote necessário.
```
# wget http://downloads.linux.hpe.com/SDR/repo/mcp/debian/pool/non-free/ssacli-4.15-6.0_amd64.deb -O /tmp/ssacli-4.15-6.0_amd64.deb
```
## Caso o link acima não esteja mais disponível, use o abaixo.
```
# wget https://github.com/joandson19/Monitar-raidhp-com-zabbix/raw/main/ssacli-4.15-6.0_amd64.deb -O /tmp/ssacli-4.15-6.0_amd64.deb
```
# Instale o pacote
```
# dpkg -i /tmp/ssacli-4.15-6.0_amd64.deb
```

# Teste 
```
# ssacli ctrl slot=0 pd all show detail
```

# Supondo que já tenha instalado e configurado o zabbix-agent
## Vamos agora baixar e adicionar os scripts
```
# mkdir /etc/zabbix/scripts
# wget https://raw.githubusercontent.com/joandson19/Monitar-raidhp-com-zabbix/main/check-ssacli.sh -O /etc/zabbix/scripts/check-ssacli.sh
# wget https://raw.githubusercontent.com/joandson19/Monitar-raidhp-com-zabbix/main/raid.conf -O /etc/zabbix/zabbix_agentd.d/raid.conf
# chmod +x /etc/zabbix/scripts/check-ssacli.sh
```

# Instale a sudo caso não possua e adicione o usuário zabbix na sudoers
```
# apt install sudo
# echo "zabbix ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

# Reinicie o zabbix
```
# service zabbix-agent restart
```

## Agora baixe a template "HP SmartArray P410i.xml", importe para o zabbix server, adicione o host onde está a raid e adicione a template e aguarde a descoberta.


