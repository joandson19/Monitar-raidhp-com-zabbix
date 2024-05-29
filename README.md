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
