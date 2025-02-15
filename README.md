# Web Doctor

> Projeto desenvolvido para a disciplina de "Paradigmas de Linguagens de Programação" - UFCG 2024.2.

---
### Descrição
O **Web Doctor** é um sistema inteligente projetado para fornecer respostas automatizadas às dúvidas comuns de pacientes, utilizando informações médicas previamente cadastradas. 

---
### Funcionalidades

| ID | Funcionalidade        | Descrição |
|----|----------------------|-------------|
| 1  | Diagnósticos        | Fazer perguntas sobre sintomas e possíveis diagnósticos. Obter recomendações básicas de tratamento ou cuidados iniciais. |
| 2  | Conhecimento prévio  | Identificar condições médicas com base em uma base de conhecimento predefinida. |
| 3  | Respostas Claras     | Fornecer respostas claras e consistentes. |

---
### Arquitetura

```lua
        +----------------------+
        |   Entrada Usuário    |
        +----------------------+
                |
                v
        +----------------------+
        |  Interface de Uso     |
        +----------------------+
                |
                v
        +----------------------+
        |  Formata Entrada     |
        +----------------------+
                |
                v
        +----------------------+
        | Análise de Sintomas  | <-----> +--------------------------+
        +----------------------+         |   Base de Conhecimento   |
                |                        +--------------------------+
                |
                v
        +----------------------+
        | Identifica Soluções  | <-----> +--------------------------+
        +----------------------+         |   Base de Conhecimento   |
                |                        +--------------------------+
                |
                v
        +----------------------+
        |   Gera Respostas     |
        +----------------------+
                |
                v
        +----------------------+
        |  Saída ao Usuário    |
        +----------------------+

```

---
### Como Executar
> Em construção

---
### Contribuidores
1. [Ana Laura](https://www.github.com/anabarrsm)
2. [Dimas Diniz](https://www.github.com/DimasGSD)

---
### Licença
Este projeto é licenciado sob a [MIT License](LICENSE).
