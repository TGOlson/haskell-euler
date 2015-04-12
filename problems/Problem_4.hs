-- Largest palindrome product
-- Problem 4
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.

module Problem_4 where

largestPal = maximum [x * y | x <- [100..999], y <- [x..999], isPalNum(x * y) ]

isPalNum :: Int -> Bool
isPalNum = isPal . numToString

numToString :: Show a => a -> String
numToString x = show x

isPal :: Eq a => [a] -> Bool
isPal x = x == reverse x

problem4 :: Int
problem4 = largestPal
