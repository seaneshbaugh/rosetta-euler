import Data.List

main :: IO ()

main = print(((foldl' (+) 0 [1..100]) ^ 2) - (foldl' (+) 0 (map (\x -> x ^ 2) [1..100])))
