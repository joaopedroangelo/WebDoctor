segundoGrau :: Double -> Double -> Double -> [Double]
segundoGrau a b c 
    | delta < 0 = []
    | delta == 0 = [(-b)/(2*a)]
    | otherwise = [(-b + sqrt delta)/(2*a),(-b - sqrt delta)/(2*a)]
    where delta = b*b - 4*a*c

main :: IO() 
main = print(segundoGrau 0 (-4) 2)