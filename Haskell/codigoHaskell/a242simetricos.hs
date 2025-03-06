simetricos :: [Int] -> [Int] 
simetricos [] = [] 
simetricos [x] = [x]
simetricos (x:xs) = [x + last xs] ++ simetricos( take (length xs - 1) xs)

main :: IO() 
main = print(simetricos[4,8,1,3,7,3])