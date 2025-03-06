applyTwice :: (a -> a) -> a -> a 
applyTwice f x = f(f x) 

incrementa :: Int -> Int 
incrementa x = x +1 

main :: IO() 
main = print(applyTwice applyTwice incrementa (incrementa 12))