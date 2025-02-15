module Doctor.WebDoctor where

import System.Process
import System.IO
import Utils.Prompts (promptInicial)

chatBot :: IO () -> IO ()  -- Agora recebe uma função de retorno como argumento
chatBot voltarMenu = do
    -- Criando um processo para rodar o comando 'ollama run llama3.2:1b'
    (Just hin, Just hout, _, ph) <- createProcess (proc "ollama" ["run", "llama3.2:1b"])
        { std_in = CreatePipe, std_out = CreatePipe }

    -- Imprime uma saudação inicial e pede ao usuário para fornecer sintomas
    putStrLn "Oi! Eu sou o WebDoctor! Quais são as suas queixas?"
    sintomas <- getLine
    let prompt = promptInicial sintomas

    -- Envia o prompt para o processo através do pipe de entrada
    hPutStrLn hin prompt
    hFlush hin
    putStrLn "Pensando..."
    resposta <- hGetContents hout
    putStrLn resposta
    _ <- waitForProcess ph

    -- Aguarda o usuário pressionar Enter antes de voltar ao menu
    putStrLn "\nPressione Enter para voltar ao menu..."
    _ <- getLine
    voltarMenu  -- Chama a função passada como argumento
