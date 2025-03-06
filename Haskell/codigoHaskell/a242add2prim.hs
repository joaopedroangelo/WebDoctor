addFirstTwo :: [Int] -> Int 
addFirstTwo (p1:p2:t) = p1 + p2 

paresMenosZero = [2,4..]

main :: IO()
main = print(addFirstTwo paresMenosZero)