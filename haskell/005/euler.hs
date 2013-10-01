import Data.List

main :: IO ()

findPrimeFactors :: (Integral a) => a -> a -> [a]
findPrimeFactors n p
    | n < (p * p)  = [n]
    | mod n p == 0 = [p] ++ (findPrimeFactors (div n p) p)
    | otherwise    = findPrimeFactors n (p + 1)

primeFactors :: (Integral a) => a -> [a]
primeFactors n = findPrimeFactors n 2

overlap :: (Ord a) => [a] -> [a] -> [a]
overlap (x:xs) []     = (x:xs)
overlap [] (y:ys)     = (y:ys)
overlap (x:xs) (y:ys) = sort ((x:xs) ++ (o (x:xs) (y:ys)))
                       where
                         o (x:xs) []      = (x:xs)
                         o [] (y:ys)      = (y:ys)
                         o (x:xs) (y:ys)  = o xs (delete x (y:ys))

main = print(foldl' (*) 1 (foldr overlap [] (map primeFactors [1..20])))
