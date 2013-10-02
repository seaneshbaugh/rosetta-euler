import Data.List

main :: IO ()

sieve :: (Integral a) => a -> a -> [a] -> [a] -> [a]
sieve prime limit primes integers
    | prime > limit = sort ((prime:primes) ++ integers)
    | otherwise     = sieve newPrime limit (prime:primes) newIntegers
                      where
                        (newPrime:newIntegers) = filter (\x -> mod x prime /= 0) integers

sieveOfEratosthenes :: (Integral a) => a -> [a]
sieveOfEratosthenes limit = sieve 2 (round $ sqrt $ fromIntegral $ limit) [] [3, 5..limit]

main = print(sum (sieveOfEratosthenes 2000000))
