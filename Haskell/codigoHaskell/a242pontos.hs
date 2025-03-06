pontos :: Int -> Int -> Int -> Int -> [(Int,Int)]
pontos a b c d = [(x,y) | x <- [a..b], y <- [c..d]]

main :: IO() 
main = print(pontos 0 3 1 6)