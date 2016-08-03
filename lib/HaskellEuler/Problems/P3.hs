-- Largest prime factor
-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?
module HaskellEuler.Problems.P3
    ( answer
    ) where

import HaskellEuler.Util.Factors


largestPrimeFactor :: Int -> Int
largestPrimeFactor = maximum . primeFactors

answer :: Int
answer = largestPrimeFactor 600851475143
