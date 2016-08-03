-- Sum square difference
-- Problem 6
-- The sum of the squares of the first ten natural numbers is,
--
-- 12 + 22 + ... + 102 = 385
-- The square of the sum of the first ten natural numbers is,
--
-- (1 + 2 + ... + 10)2 = 552 = 3025
-- Hence the difference between the sum of the squares of the first ten
-- natural numbers and the square of the sum is 3025 − 385 = 2640.
--
-- Find the difference between the sum of the squares of the first
-- one hundred natural numbers and the square of the sum.

module HaskellEuler.Problems.P6
    ( answer
    ) where

square :: Int -> Int
square = (^ (2 :: Int))

sumOfTheSquares :: [Int] -> Int
sumOfTheSquares = sum . map square

squareOfTheSums :: [Int] -> Int
squareOfTheSums = square . sum

differenceOfSquaresAndSums :: [Int] -> Int
differenceOfSquaresAndSums xs = squareOfTheSums xs - sumOfTheSquares xs

answer :: Int
answer = differenceOfSquaresAndSums [1..100]

-- One-liner, for fun:
-- problem6 = ((^2) $ sum [1..100]) - (sum $ map (^2) [1..100])
