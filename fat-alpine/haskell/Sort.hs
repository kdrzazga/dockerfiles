module Sort where

bubblesort'iter :: (Ord a) => [a] -> [a]

bubblesort'iter (x:y:xs)
    | x > y = y : bubblesort'iter (x:xs)
    | otherwise = x : bubblesort'iter (y:xs)
bubblesort'iter (x) = (x)

help = print "Usage: bubblesort (3, 6, 1)"
