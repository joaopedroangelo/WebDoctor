filterShortWords :: [String] -> Int -> [String] 
filterShortWords lista n = filter (\word -> length word < n) lista

main :: IO() 
main = print(filterShortWords ["Casa","Caminho","Trabalho","Ovo",""] 5)