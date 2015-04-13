-- Largest prime factor
-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?
module Problem_3 where

import Factors


largestPrimeFactor :: Int -> Int
largestPrimeFactor = maximum . primeFactors

problem3 :: Int
problem3 = largestPrimeFactor 600851475143
