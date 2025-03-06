indexOf :: Int -> [t] -> t 
indexOf 0 (x:xs) = x
indexOf n (x:xs) = indexOf (n-1) xs 

main :: IO() 
main = print(indexOf 2 [9,8,7,6,5])