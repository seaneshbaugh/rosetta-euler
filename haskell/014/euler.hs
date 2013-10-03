import Data.List

main :: IO ()

collatz :: (Integral a) => a -> a
collatz n
    | n <= 1       = 1
    | mod n 2 /= 0 = (3 * n) + 1
    | otherwise    = div n 2

nextCollatz :: (Integral a) => [a] -> [a]
nextCollatz l
    | (head l) > 1 = nextCollatz((collatz (head l)) : l)
    | otherwise    = l

collatzSequence :: (Integral a) => a -> [a]
collatzSequence n = reverse (nextCollatz [n])

maxBySequenceLength :: (Integral a) => (a, [a]) -> (a, [a]) -> (a, [a])
maxBySequenceLength a b
    | (length (snd a)) > (length (snd b)) = a
    | otherwise                       = b

main = print(fst (foldl (\acc x -> maxBySequenceLength acc x) (0, []) (map (\x -> (x, collatzSequence(x))) [1..1000000])))
