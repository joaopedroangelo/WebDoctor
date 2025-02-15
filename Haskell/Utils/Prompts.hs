module Utils.Prompts where

-- Prompt inicial para o chatbot médico
promptInicial :: String -> String
promptInicial sintomas = unlines
    [ "Você é um assistente médico especializado em diagnóstico."
    , "O usuário fornecerá uma sequência de sintomas"
    , "e seu objetivo é sugerir possíveis causas médicas com base nesses sintomas."
    , "Seja claro, objetivo e indique quando for necessário buscar ajuda profissional."
    , "Liste as possíveis condições médicas relacionadas aos sintomas informados."
    , "Sugira ações que o usuário pode tomar, para melhorar os seus sintomas."
    , ""
    , "Sintomas informados: " ++ sintomas
    , "FOQUE APENAS NO SINTOMA INFORMADO, NADA ALÉM."
    , "RESUMA SUAS RESPOSTAS."
    , "SUGIRA APENAS 3 POSSÍVEIS CAUSAS."
    ]

-- Prompt genérico para continuar a conversa
promptContinuar :: String -> String
promptContinuar entrada = "Usuário: " ++ entrada
