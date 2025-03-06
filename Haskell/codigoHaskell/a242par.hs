ehpar :: Int -> Bool 
ehpar x = x `mod` 2 == 0

main :: IO() 
main = print(ehpar 8)