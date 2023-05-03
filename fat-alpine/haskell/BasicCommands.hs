module BasicCommands where

import Data.List
import System.IO

maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer can be as huge as we want
hugeInteger = 1 :: Integer
--hugeInteger = maxInt + 2000 :: Integer -- error types incompatible

bigFloat = 3.12345678901 +0.00000000005
biggerFloat = 3.123456789012345678901 +0.123456789012345678901 --will be truncated to 16 places after comma

always5 :: Int
always5 = 5 --non const actually

sumOfNum = sum[1..1000]

modulo = mod 5 4
anotherModulo = 5 `mod` 4 -- ` is key with ~, not '

--negativeNumber1 = 5 + -4 --error
negativeNumber2 = 5 + (-4) -- correct

num9 = 9 :: Int
--sqrt9a = sqrt(num9) --error
sqrt9b = sqrt(fromIntegral num9) --correct

piValue = pi
ePow1 = exp 1
logOfe = log 2.718281828459045
square9 = 9 ** 2
twoPow4 = 2 ** 4
floorVal = floor 9.999

sinusPi_2 = sin(pi/2)

trueAndFalse = True && False
trueOrFalse = True || False
false = not(True)

--Lists only single linked, addition only to the end
primeNumbers = [3, 5, 7, 11]

--lists are concatenated with ++
morePrimes = primeNumbers ++ [13, 17, 19, 23, 29]

--add items at the bieginning of list
evenMorePrimes = 1 : morePrimes
evenMorePrimesLen = length evenMorePrimes

-- create list using : with [] at the end
numbersList = 2 : 6 : 8 : 1 : []

listInsideList = [[1,2,4], [-1, 10, 3.4]]

reverseNumbersList = reverse numbersList
isReverseNumbersListEmpty = null reverseNumbersList

firstListElement = head numbersList
first3Elements = take 3 numbersList
lastListElement = last numbersList


primeInit = init primeNumbers --copy list
removed = drop 2 primeInit -- now primeInit != primeNumbers
is11InList = 11 `elem` primeInit

maxElement = maximum primeNumbers
minElement = minimum primeNumbers

newList = [2,3,5]
iloczyn = product newList
suma = sum newList

zeroToTen = [0..10]
evenNumbers = [2,4 .. 20]

letterList = ['A', 'C' .. 'Z']

infinite10 = [10, 20..] -- This is INFINITE list, but Haskell is lazy - elements will be created only when they are called
is200000000inInfinite10 = 200000000 `elem` infinite10

ten2s = take 10 (repeat 2)
twelve5s = replicate 12 5 -- alternative to repeat
cycleList = take 12 (cycle [1,2,3,4,5])

listTimes2 = [x * 2 | x <- [1..10]]
listTimes3 = [x * 3 | x <- [1..10], x*3 <=50] --filter

--take values divisible by 13 from 1 to 500 list,
--and (2nd filter) divisible by 9
numbersDivisibleBy9And13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

sortedList = sort [1,33,5,33,2,11]
sortedReverselyList = reverse sortedList -- reverse sort [1,33,5,33,2,11] causes error

sumOfLists = zipWith (+) [1,2, 3] [3,4, 5] -- very POWERFUL

listBiggerThan5 = filter (>5) sortedList

evensUpTo20 = takeWhile (<=20) [2, 4 ..]

tabliczkaMnozenia = [[x * y | y <- [1..10]] | x <- [1..10]]

--tuples
randTupe = (1, "Random tuple")
janKowalski = ("Jasiu Kowalski", 33)
janKowalskiName = fst janKowalski
janKowalskiAge = snd janKowalski

--creating tuples with zip
names = ["Ala","Ola","Ula"]
addresses = ["Rynek 11", "Pilsudskiego 33", "Armii Krajowej 2"]
namesAndAddresses = zip names addresses
