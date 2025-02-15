module Utils.LimparTela where

import System.Process (callCommand) -- Importa para limpar o terminal

-- Função para limpar o terminal
limparTela :: IO ()
limparTela = callCommand "clear"  -- Use "cls" no Windows, se necessário
