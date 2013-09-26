main :: IO ()

findPrimeFactors :: (Integral a) => a -> a -> [a]
findPrimeFactors n p
    | n < (p * p)  = [n]
    | mod n p == 0 = [p] ++ (findPrimeFactors (div n p) p)
    | otherwise    = findPrimeFactors n (p + 1)

primeFactors n = findPrimeFactors n 2

main = print(maximum(primeFactors 600851475143))
