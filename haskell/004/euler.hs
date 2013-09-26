main :: IO ()

main = print(maximum(filter(\n -> (reverse (show n)) == (show n))(concat(map(\x -> map(\y -> x * y)[100, 101..999])[100, 101..999]))))
