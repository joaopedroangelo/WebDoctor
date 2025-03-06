removeMin :: String -> String 
removeMin [] = []
removeMin word = filter (\x -> x `elem` ['A'..'Z']) word

main :: IO() 
main = print(removeMin "TeSte de STrinG.")