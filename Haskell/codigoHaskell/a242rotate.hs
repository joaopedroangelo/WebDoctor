rotate :: [Int] -> Int -> [Int]
rotate l 0 = l 
rotate (h:t) n = rotate (t ++ [h]) (n-1)

main :: IO() 
main = print(rotate[1,2,3,4,5] 2)