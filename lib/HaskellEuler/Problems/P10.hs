-- Summation of primes
-- Problem 10
-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
-- Find the sum of all the primes below two million.

module HaskellEuler.Problems.P10
    ( answer
    ) where

import HaskellEuler.Util.Primes

sumOfPrimesBelow :: Int -> Int
sumOfPrimesBelow = sum . takePrimesBelow

answer :: Int
answer = sumOfPrimesBelow 2000000
