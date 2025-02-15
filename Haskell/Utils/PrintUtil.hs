module Utils.PrintUtil where
import Control.Exception
import System.IO.Unsafe( unsafeDupablePerformIO )
import System.Environment
import System.IO


readUTF8 :: FilePath -> IO String
readUTF8 path = bracket
    (openFile path ReadMode)
    (\handle -> hClose handle)
    (\handle -> do
        hSetEncoding handle utf8
        contents <- hGetContents handle
        evaluate (length contents)  -- Avalia todo o conteúdo
        return contents
    )

    
-- Exibe no terminal o conteudo de um arquivo .txt a partir de seu FilePath
printTxt :: FilePath -> IO ()
printTxt filePath = do
    putStrLn "\ESC[2J"
    content <- readUTF8 filePath
    putStr content
