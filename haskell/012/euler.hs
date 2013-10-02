import Data.List

main :: IO ()

findPrimeFactors :: (Integral a) => a -> a -> [a]
findPrimeFactors n p
    | n < (p * p)  = [n]
    | mod n p == 0 = [p] ++ (findPrimeFactors (div n p) p)
    | otherwise    = findPrimeFactors n (p + 1)

primeFactors :: (Integral a) => a -> [a]
primeFactors n = findPrimeFactors n 2

numberOfDivisors :: (Integral a) => a -> a
numberOfDivisors n = product (map (\x -> (genericLength x) + 1) (group (primeFactors n)))

findTriangleNumber :: (Integral a) => a -> a -> a
findTriangleNumber divisorLimit n
    | divisors < divisorLimit = findTriangleNumber divisorLimit (n + 1)
    | otherwise = triangleNumber
    where
      triangleNumber = sum [1..n]
      divisors = numberOfDivisors triangleNumber

findTriangleNumberWithDivisors :: (Integral a) => a -> a
findTriangleNumberWithDivisors divisorLimit = findTriangleNumber divisorLimit 2

main = print(findTriangleNumberWithDivisors 500)
