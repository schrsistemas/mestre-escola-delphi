# Deploy em Producao - License Server + Admin Panel

## 1. Servidor (VPS recomendado)
- DigitalOcean / AWS / Vultr
- Ubuntu 22.04

---

## 2. Instalar Node

```bash
sudo apt update
sudo apt install nodejs npm -y
```

---

## 3. Subir API

```bash
node admin_panel_nodejs.js
```

Rodando em:
http://SEU_IP:3000

---

## 4. Instalar Nginx (proxy + HTTPS)

```bash
sudo apt install nginx -y
```

---

## 5. Configuracao Nginx

```nginx
server {
  listen 80;
  server_name seu-dominio.com;

  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}
```

---

## 6. HTTPS com Certbot

```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d seu-dominio.com
```

---

## 7. Rodar como servico (PM2)

```bash
npm install -g pm2
pm2 start admin_panel_nodejs.js
pm2 save
pm2 startup
```

---

## 8. Banco de Dados (opcional)

- PostgreSQL ou Firebird
- Persistir licencas

---

## 9. Ajustar ERP

Alterar URL:

```pascal
https://seu-dominio.com/validate
```

---

## 10. Seguranca

- Token no header
- HTTPS obrigatorio
- Backup banco

---

## Resultado

- ERP validando online
- Painel web acessivel
- Controle total de clientes

---

## Proximo Nivel

- Login no painel
- Dashboard
- Pagamento automatico (PIX)
