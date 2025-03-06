areaCirculo :: Float -> Float 
areaCirculo r = pi * r^2

diferencaAreas :: Float -> Float -> Float 
diferencaAreas r1 r2 = abs(areaCirculo r1 - areaCirculo r2)

main :: IO()
main = do 
    r1 <- readLn 
    r2 <- readLn 
    print(diferencaAreas r1 r2)