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
| 2  | Medicamentos         | Consultar informações sobre medicamentos e suas indicações. |
| 3  | Conhecimento prévio  | Identificar condições médicas com base em uma base de conhecimento predefinida. |
| 4  | Médicos Cadastrados | Sugerir ações como consultar um médico em casos graves. |
| 5  | Respostas Claras     | Fornecer respostas claras e consistentes. |

---
### Arquitetura

```lua
        +-------------------+
        | Entrada Usuário  | --------
        +-------------------+        |                       
                                     |                       
                                     v                       
                          +-------------------+      +-------------------+
                          |  Interface de Uso  | --> |  Verifica Entrada |
                          +-------------------+      +-------------------+
                                    |                  
                                    |                 
                                    +
                                    |
                                    v
                         +-------------------+
                        | Análise de Sintomas |
                         +-------------------+
                                    |
                                    v
                         +-------------------+
                         |   Base de Dados   |
                         +-------------------+

```

---
### Como Executar
> Em construção

---
### Contribuidores
1. [Ana Laura](https://www.github.com/anabarrsm)
2. [Dimas Diniz](...)

---
### Licença
Este projeto é licenciado sob a [MIT License](LICENSE).
