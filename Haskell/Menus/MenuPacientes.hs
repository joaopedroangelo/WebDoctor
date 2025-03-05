module Menus.MenuPacientes (menuGerPacientes) where

import System.IO
import System.Directory
import Data.List

-- Definição do tipo Patient
data Patient = Patient Int String Int deriving (Show, Read, Eq)

-- Nome do arquivo onde os pacientes são armazenados
fileName :: String
fileName = "pacientes.txt"

-- Carrega os pacientes do arquivo
loadData :: IO [Patient]
loadData = do
    exists <- doesFileExist fileName
    if exists
        then do
            contents <- readFile fileName
            return (if null contents then [] else read contents)
        else return []

-- Salva os pacientes no arquivo
saveData :: [Patient] -> IO ()
saveData patients = writeFile fileName (show patients)

-- Consulta um paciente pelo ID
queryPatient :: Int -> IO ()
queryPatient idP = do
    patients <- loadData
    case find (\(Patient id nome idade) -> id == idP) patients of
        Just (Patient id nome idade) -> do
            putStrLn $ "Id: " ++ show id
            putStrLn $ "Nome: " ++ nome
            putStrLn $ "Idade: " ++ show idade
        Nothing -> putStrLn "Paciente não encontrado."

-- Adiciona um novo paciente
includePatient :: Int -> String -> Int -> IO ()
includePatient idP nomeP idadeP = do
    patients <- loadData
    if any (\(Patient id _ _) -> id == idP) patients
        then putStrLn "Paciente já cadastrado!"
        else do
            let newPatient = Patient idP nomeP idadeP
            saveData (newPatient : patients)
            putStrLn "Paciente incluído com sucesso."

-- Modifica um paciente existente
changePatient :: Int -> String -> Int -> IO ()
changePatient idP nomeP idadeP = do
    patients <- loadData
    let updatedPatients = Patient idP nomeP idadeP : filter (\(Patient id _ _) -> id /= idP) patients
    saveData updatedPatients
    putStrLn "Paciente alterado com sucesso."

-- Exclui um paciente
excludePatient :: Int -> IO ()
excludePatient idP = do
    patients <- loadData
    let updatedPatients = filter (\(Patient id _ _) -> id /= idP) patients
    saveData updatedPatients
    putStrLn "Paciente excluído com sucesso."

-- Menu para gerenciamento de pacientes
menuGerPacientes :: IO () -> IO ()
menuGerPacientes voltarMenu = do
    putStrLn "\nGerenciamento de Pacientes"
    putStrLn "1. Pesquisar Paciente"
    putStrLn "2. Incluir Paciente"
    putStrLn "3. Excluir Paciente"
    putStrLn "4. Alterar Paciente"
    putStrLn "5. Voltar ao Menu Inicial"
    putStr "Escolha uma opção: "
    opcao <- getLine
    processGerPacientes (read opcao) voltarMenu


-- Processa a opção escolhida pelo usuário
processGerPacientes :: Int -> IO () -> IO ()
processGerPacientes 1 voltarMenu = do
    putStr "Digite o ID do paciente: "
    idP <- readLn
    queryPatient idP
    menuGerPacientes voltarMenu


processGerPacientes 2 voltarMenu = do
    putStr "Digite o ID do paciente: "
    idP <- readLn
    putStr "Digite o nome do paciente: "
    nomeP <- getLine
    putStr "Digite a idade do paciente: "
    idadeP <- readLn
    includePatient idP nomeP idadeP
    menuGerPacientes voltarMenu

processGerPacientes 3 voltarMenu = do
    putStr "Digite o ID do paciente: "
    idP <- readLn
    excludePatient idP
    menuGerPacientes voltarMenu

processGerPacientes 4 voltarMenu = do
    putStr "Digite o ID do paciente: "
    idP <- readLn
    putStr "Digite o nome do paciente: "
    nomeP <- getLine
    putStr "Digite a idade do paciente: "
    idadeP <- readLn
    changePatient idP nomeP idadeP
    menuGerPacientes voltarMenu

processGerPacientes 5 voltarMenu = voltarMenu
processGerPacientes _ voltarMenu = do
    putStrLn "Opção inválida."
    menuGerPacientes voltarMenu
