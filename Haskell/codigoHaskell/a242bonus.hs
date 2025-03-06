bonus :: Int -> Double
bonus pontos 
    | pontos <= 0 = 0
    | pontos <= 10 = 100
    | pontos <= 20 = 200 
    | pontos <= 30 = 300 
    | pontos <= 40 = 400 
    | otherwise = 500 

main :: IO() 
main = do 
    p <- readLn 
    print("Bonus obtido: R$ "++ show (bonus p))