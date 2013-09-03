main :: IO ()

nextFibLessThan limit fibs = if (fibs !! (length fibs - 1)) + (fibs !! (length fibs - 2)) > limit
                               then fibs
                               else nextFibLessThan limit (fibs ++ [(fibs !! (length fibs - 1)) + (fibs !! (length fibs - 2))])

fibsLessThan limit = nextFibLessThan limit [0, 1]

main = print(sum(filter(\x -> mod x 2 == 0)(fibsLessThan 4000000)))
