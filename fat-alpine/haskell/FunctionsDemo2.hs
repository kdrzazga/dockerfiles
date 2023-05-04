module FunctionsDemo2 where

isOdd :: Int -> Bool

isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

--different version
isEven n = n `mod` 2 == 0


whatEducation :: Int -> String
whatEducation age
    | (age >=5) && (age <= 6) = "Kindergatden"
    | (age >6) && (age <= 15) = "Elementary school"
    | (age >15) && (age <= 18) = "Secondary school"
    | otherwise = "Studies or work"

--goal scoring rating
goalAvgRating :: Double -> Double -> String

goalAvgRating attempts score
    |avg <= 0.2 = "Terrible scoring ratio"
    |avg <= 0.3 = "Medium"
    |avg <= 0.6 = "Good"
    |otherwise = "Master"
    where avg = score/attempts

getListItems :: [Int] -> String

getListItems [] = "Empty list"
getListItems (x :[]) = "List starts with " ++ show x
getListItems (x: y: []) = " List contains: " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "1st item is " ++ show x ++" and the rest is " ++ show xs
