module FunctionsDemo where

--  :: means 'has type'
add :: Integer -> Integer -> Integer

--Function declaration:
-- funcName param1 param2 = operations (return value)
add x y = x + y --works ONLY with Integers
--funcName CANNOT start with capital letter

sumMe x y  = x + y --works also with Floats

inc x = x + 1
plus2 y = inc(inc(y))

square b = b*b
delta a b c = square(b) - 4 * a * c

describeLetter :: Char -> String
describeLetter c =
    if c >= 'a' && c <= 'z'
        then "Lower case"
        else if c >= 'A' && c <= 'Z'
            then "Upper case"
            else "Not an ASCII letter"

describeLetter2 :: Char -> String
describeLetter2 c
   | c >= 'a' && c <= 'z' = "Lower case"
   | c >= 'A' && c <= 'Z' = "Upper case"
   | otherwise            = "Not an ASCII letter"

help = print "Avaialable functions: add 2 3, inc 5, describeLetter '1'"

-- Tuple with Ints and another Tuple with Ints give Tuple with Ints as result
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x,y) (x2, y2) = (x +x2, y + y2)

whatAge :: Int -> String

whatAge 7 = "You go to school"
whatAge 18 = "You can vote"
whatAge x = "Nothing important"
