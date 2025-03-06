conceito :: Float -> Char 
conceito n 
    | n >= 9 = 'A'
    | n >= 7.5 = 'B'
    | n >= 6 = 'C' 
    | n >= 4 = 'D' 
    | otherwise = 'E'

main :: IO() 
main = print(conceito 8)