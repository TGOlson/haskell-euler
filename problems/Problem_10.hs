-- Summation of primes
-- Problem 10
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
-- Find the sum of all the primes below two million.

module Problem_10 where

import Primes

sumOfPrimesBelow :: Int -> Int
sumOfPrimesBelow = sum . takePrimesBelow

problem10 :: Int
problem10 = sumOfPrimesBelow 2000000
