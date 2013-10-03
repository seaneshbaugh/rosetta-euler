import Data.List

main :: IO ()

binomialCoefficient :: (Integral a, Show a) => a -> a -> a
binomialCoefficient top bottom
    | (top - bottom + 1) >= top || bottom < 2 = error ("binomialCoefficient " ++ showsPrec 11 top " " ++ showsPrec 11 bottom "")
    | otherwise                               = div (product [(top - bottom + 1)..top]) (product [2..bottom])

latticePaths :: (Integral a, Show a) => a -> a -> a
latticePaths m n
    | m <= n    = binomialCoefficient (m + n) n
    | otherwise = binomialCoefficient (m + n) m

main = print(latticePaths 20 20)
