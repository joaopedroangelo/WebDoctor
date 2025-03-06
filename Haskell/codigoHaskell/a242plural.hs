plural :: [String] -> Int 
plural palavras = length (filter (\word -> last word == 's') palavras)

main :: IO() 
main = print(plural ["dinheiro","mulheres","automovel","mulheres","iate","mulheres","mansões"])