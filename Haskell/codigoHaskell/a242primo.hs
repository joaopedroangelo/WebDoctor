proxDivisor :: Int -> Int -> Int 
proxDivisor valor x = if mod valor x == 0 
    then x 
    else proxDivisor valor (x+1)

primo :: Int -> Bool 
primo valor = proxDivisor valor 2 == valor

main :: IO() 
main = print(primo 2)