dobrarElementos :: [Int] -> [Int] 
dobrarElementos [] = []
dobrarElementos (h:t) = [2*h] ++ dobrarElementos t

dobrarElementos2 :: [Int] -> [Int] 
dobrarElementos2 l = [n*2 | n <- l]

main :: IO()
main = print(dobrarElementos2 [1,2,3,4,5])