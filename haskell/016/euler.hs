import Data.List

main :: IO ()

main = print(sum (map (\x -> read [x] :: Int) (show (2 ^ 1000))))
