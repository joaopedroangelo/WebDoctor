module Menus.MenuManager where

import Doctor.WebDoctor (chatBot)
import System.IO (hFlush, stdout)
import qualified Distribution.ModuleName as Doctor.WebDoctor
import Utils.PrintUtil (printTxt)
import Utils.LimparTela (limparTela)

menuInicial :: IO ()
menuInicial = do
    limparTela
    putStrLn "==================================="
    putStrLn "         MENU INICIAL"
    putStrLn "==================================="
    putStrLn "1 - Conversar com o WebDoctor"
    putStrLn "2 - Visualizar lista de Sintomas, Causas e Tratamentos"
    putStrLn "0 - Sair"
    putStrLn "==================================="
    putStr "Escolha uma opção: "
    hFlush stdout -- Garante que o texto seja exibido antes de esperar a entrada do usuário
    opcao <- getLine
    processarOpcao opcao


processarOpcao :: String -> IO ()
processarOpcao "1" = chatBot menuInicial
processarOpcao "2" = do
    printTxt "./Menus/Tabela.txt"
    putStrLn "\nPressione Enter para voltar ao menu..."
    _ <- getLine
    menuInicial
processarOpcao "0" = putStrLn "Saindo do programa..."
processarOpcao _   = do
    putStrLn "Opção inválida! Tente novamente."
    menuInicial


