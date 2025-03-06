somarLista :: [Int] -> Int 
somarLista [] = 0
somarLista (h:t) = h + somarLista t 

main :: IO()
main = print(somarLista [1,2,3,4])