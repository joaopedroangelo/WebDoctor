quadPares :: [Int]
quadPares = [n^2 | n <- [1..20], even n]

main :: IO() 
main = print quadPares