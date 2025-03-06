maxElem :: [Int] -> Int 
maxElem [x] = x
maxElem (x:xs)
    | x >= maxElem xs = x 
    | otherwise = maxElem xs 

main :: IO() 
main = print(maxElem [6,8,9,12,4,7])