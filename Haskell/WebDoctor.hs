import System.Process
import System.IO
import Utils.Prompts
import Utils.Prompts as Prompts

main :: IO ()
main = do

    -- Criando um processo para rodar o comando 'ollama run llama3.1:latest'
    (Just hin, Just hout, _, ph) <- createProcess (proc "ollama" ["run", "llama3.1:latest"])
        { std_in = CreatePipe, std_out = CreatePipe }

    -- Imprime uma saudação inicial e pede ao usuário para fornecer sintomas
    putStrLn "Bem-Vindo ao seu assistente médico virtual. Quais as suas queixas?"
    sintomas <- getLine
    let prompt = Prompts.promptInicial sintomas

    -- Envia o prompt para o processo através do pipe de entrada
    hPutStrLn hin prompt
    hFlush hin
    putStrLn "Pensando..."
    resposta <- hGetContents hout
    putStrLn resposta
    _ <- waitForProcess ph

    return ()
