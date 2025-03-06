import Prelude hiding ((*)) -- Isso "esconde" o operador original, que deixa de funcionar

(*) :: String -> Int -> String
word * 0 = "" 
word * x = word ++ (word * (x-1))

main :: IO () 
main = print("Teste" * 3)