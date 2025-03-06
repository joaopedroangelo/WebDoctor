stringvezes :: String -> Int -> IO() 
stringvezes s v = do
    if v <= 0 
        then return() 
        else do 
            print s 
            stringvezes s (v-1)

main :: IO() 
main = stringvezes "Teste" 5