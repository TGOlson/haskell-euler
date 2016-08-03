-- Largest palindrome product
-- Problem 4
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.

module HaskellEuler.Problems.P4
    ( answer
    ) where

largestPal :: Int
largestPal = maximum [x * y | x <- [100..999], y <- [x..999], isPalNum(x * y) ]

isPalNum :: Int -> Bool
isPalNum = isPal . numToString

numToString :: Show a => a -> String
numToString = show

isPal :: Eq a => [a] -> Bool
isPal x = x == reverse x

answer :: Int
answer = largestPal
