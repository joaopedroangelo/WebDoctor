addSpaces :: Int -> String -> String 
addSpaces 0 word = word 
addSpaces n word = " " ++ addSpaces (n-1) word  

main :: IO() 
main = print(addSpaces 5 "Teste")