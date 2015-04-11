import Data.List
-- imported for problem 4 (maximum)

-- Reference for 1-10
-- https://wiki.haskell.org/Euler_problems/1_to_10

-- Euler Problem 1
sumMult :: Int -> Int
sumMult y = sum [x | x <- [1..y - 1], x `mod` 3 == 0 || x `mod` 5 == 0]

-- Euler Problem 2

sumOfEvenFibsBelow :: Int -> Int
sumOfEvenFibsBelow x = sum . filter even $ fib x

-- fibs :: [Int]
-- fibs = 1:1: [fibs + (last (init fibs)))]

fib :: Int -> [Int]
fib 0 = []
fib 1 = [1]
fib 2 = [1, 2]
fib x = addUntil x [1, 2]

addUntil :: Int -> [Int] -> [Int]
addUntil x xs
  | x < next = xs
  | otherwise =  addUntil x (xs ++ [next])
  where next = last xs + (last (init xs))


-- Euler Problem 3

largestPrimeFactor :: Int -> Int
largestPrimeFactor = maximum . getFactors

getFactors :: Int -> [Int]
getFactors = getFactorsWithContainer []

getFactorsWithContainer xs 1 = xs
getFactorsWithContainer xs x = getFactorsWithContainer xs' x'
    where firstFactor = head [factor | factor <- [2..x], isFactorOf factor x]
          x' = x `div` firstFactor
          xs' = firstFactor:xs

-- Euler Problem 4
largestPal = maximum [x * y | x <- [100..999], y <- [x..999], isPalNum(x * y) ]

isPalNum :: Int -> Bool
isPalNum = isPal . numToString

numToString :: Show a => a -> String
numToString x = show x

isPal :: Eq a => [a] -> Bool
isPal x = x == reverse x

-- Euler Problem 5

divisableByAll xs = head [x | x <- [20,40..], isDivisableByAll xs x]

-- isDivisableByAll xs x = all (== True) $ showIsFactor xs x
isDivisableByAll xs x = all (\v -> isFactorOf v x) xs

isFactorOf x y = y `mod` x == 0
