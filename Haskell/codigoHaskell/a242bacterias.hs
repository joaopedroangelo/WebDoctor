bacterias :: Int -> Int -> Int 
bacterias p 0 = p 
bacterias p t = 2 * bacterias p (t-1)

main :: IO()
main = print(bacterias 0 10)