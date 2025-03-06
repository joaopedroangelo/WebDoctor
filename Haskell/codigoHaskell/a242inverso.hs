invertidos :: IO() 
invertidos = do 
    x <- readLn 
    if x == -1 
        then return()
        else do 
            invertidos 
            print x

main :: IO() 
main = invertidos