# License Server - SmartIcon AI

## Arquitetura

Cliente (ERP Delphi)
   ↓ HTTP REST
Servidor de Licencas
   ↓
Banco (Firebird ou PostgreSQL)

---

## Endpoints

### POST /validate
Request:
{
  "client": "EMPRESA X",
  "machine_id": "ABC123",
  "module": "ICON_ENGINE"
}

Response:
{
  "status": "OK",
  "license": "AI",
  "expires": "2026-12-31"
}

---

### POST /activate
Request:
{
  "key": "XXXX-XXXX-XXXX",
  "machine_id": "ABC123"
}

---

## Estrutura Banco

LICENSES
- ID
- CLIENT
- KEY
- TYPE (FREE/PRO/AI)
- EXPIRES
- ACTIVE

MACHINES
- ID
- LICENSE_ID
- MACHINE_ID

---

## Fluxo

1. ERP inicia
2. Chama /validate
3. Servidor responde tipo licenca
4. ERP ativa recursos

---

## Seguranca

- HTTPS obrigatorio
- Token por requisicao
- Hash da maquina

---

## Observacao

Servidor pode ser implementado em:
- Node.js
- Delphi Horse
- .NET

---

## Monetizacao

- Controle centralizado
- Bloqueio remoto
- Expiracao automatica
