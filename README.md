# Website Prod Infra

Este repositório contém a **infraestrutura da aplicação Website** na AWS, gerenciada via **Terraform**.  
Inclui configuração de **EC2**, **Security Groups**, **IAM Roles** e integração com **GitHub Actions** para CI/CD.

---

## ⚙️ Tecnologias

- **Terraform** - Infraestrutura como Código
- **AWS** - EC2, VPC, Security Groups, IAM
- **GitHub Actions** - Automação de CI/CD
- **S3** - Armazenamento do Terraform State
- **DynamoDB** (opcional) - Lock do Terraform State

---

## 📦 Estrutura do repositório

```  
├── backend.tf # Configuração do backend S3
├── ec2.tf # Recursos EC2, Security Groups e IAM Roles
├── user_data.sh # Script de inicialização da instância
├── .github/
│ └── workflows/
│ └── terraform.yml # Workflow de CI/CD
└── README.md # Este arquivo
```  

---

## 🔧 Variáveis e Secrets

O Terraform usa variáveis que **não devem ser expostas** no repositório.  
Valores sensíveis devem ser configurados via **GitHub Secrets** ou arquivo `terraform.tfvars` local (não versionado).

**Secrets recomendados para GitHub Actions:**

```  
| Nome | Descrição |
|------|-----------|
| `AWS_ACCESS_KEY_ID` | Chave de acesso AWS |
| `AWS_SECRET_ACCESS_KEY` | Secret Key AWS |
| `AWS_REGION` | Região AWS |
| `AMI_ID` | ID da AMI a ser usada |
| `KEY_NAME` | Nome da keypair EC2 |
| `VPC_ID` | VPC onde os recursos serão criados |
| `ALLOWED_SSH_IP` | IP permitido para SSH (ex: `177.121.114.159/32`) |
```  

---

## 🚀 Como rodar localmente

1. Instale [Terraform](https://developer.hashicorp.com/terraform/downloads)
2. Configure as credenciais AWS localmente:
```
aws configure
```
3. Inicialize Terraform:
```
terraform init
```
4. Valide a configuração:
```
terraform validate
```
6. Crie o plano e aplique:
```
terraform plan -out=tfplan
terraform apply tfplan
```
🤖 CI/CD via GitHub Actions

O workflow terraform.yml permite:

Criar ou atualizar a infraestrutura (apply)

Gerar plano de destruição (plan_destroy)

Destruir a infraestrutura (destroy)

Você pode disparar manualmente pelo GitHub Actions, usando os inputs do workflow.









