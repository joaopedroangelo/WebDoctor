maiorde3 :: Int -> Int -> Int -> Int 
maiorde3 a b c = if a >= b 
    then if a >= c then a else c 
    else if b >= c then b else c 

maiorde3v2 :: Int -> Int -> Int -> Int 
maiorde3v2 a b c 
    | a >= b && a >= c = a 
    | b >= a && b >= c = b 
    | otherwise = c 

main :: IO() 
main = print(maiorde3v2 1 5 4) 