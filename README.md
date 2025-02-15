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
        |  Processamento LLM   |
        +----------------------+
                |
                v
        +----------------------+
        |  Formata Resposta    |
        +----------------------+
                |
                v
        +----------------------+
        |       Saída          |
        +----------------------+
```

---
### Como Executar

**Haskel**: <br>
```shell
        1. Clone este repositório
        2. Instale o Ollama: https://ollama.com/download
        3. No terminal, digite: ollama pull llama3.2:1b
        4. Pelo terminal, acesse o diretório: /WebDoctor/Haskell
        5. Carregue os módulos com o comando: ghci Main.gs
        6. Execute o módulo principal com o comando: main
```

---
### Contribuidores
1. [Ana Laura](https://www.github.com/anabarrsm)
2. [Dimas Diniz](https://www.github.com/DimasGSD)

---
### Licença
Este projeto é licenciado sob a [MIT License](LICENSE).
