import Data.List

main :: IO ()

findPythagoreanTriple :: (Integral a, Show a) => a -> a -> a -> [a]
findPythagoreanTriple sum m n
    | sum  < 12 = error ("findPythagoreanTriple " ++ (show sum))
    | m < sum && n < sum - 1 && m > n && a + b + c == sum && (a * a) + (b * b) == (c * c) = [a, b, c]
    | m < sum && n < sum - 1 && m > n = findPythagoreanTriple sum m (n + 1)
    | m < sum && n < sum - 1          = findPythagoreanTriple sum (m + 1) 1
    | otherwise                       = []
    where
      a = (m * m) - (n * n)
      b = 2 * m * n
      c = (m * m) + (n * n)

pythagoreanTripleWithSum :: (Integral a, Show a) => a -> [a]
pythagoreanTripleWithSum sum = findPythagoreanTriple sum 2 1

main = print(product (pythagoreanTripleWithSum 1000))
