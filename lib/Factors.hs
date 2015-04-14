module Factors where

import Data.List

import Primes

getFactors :: Int -> [Int]
getFactors x
  | odd x = 1 : [y | y <- [3,5..(x `div` 3)], isFactorOf y x] ++ [x]
  | otherwise = 1 : [y | y <- [2..(x `div` 2)], isFactorOf y x] ++ [x]


-- If the prime decomposition of a number n is: n = p1^a * p2^b * p3^c
-- then the number of divisors is (a + 1) * (b + 1) * (c + 1).
numFactors :: Int -> Int
numFactors = product . map ((+1) . length) . group . primeFactors

isFactorOf :: Int -> Int -> Bool
isFactorOf x y = y `mod` x == 0

commonFactors :: Int -> Int -> [Int]
commonFactors x y = intersect (getFactors x) (getFactors y)

primeFactors :: Int -> [Int]
primeFactors = getPrimeFactorsWithContainer []

-- try to refactor this into a single function
getPrimeFactorsWithContainer :: [Int] -> Int -> [Int]
getPrimeFactorsWithContainer xs 1 = xs
getPrimeFactorsWithContainer xs x = getPrimeFactorsWithContainer xs' x'
    where
      nextPrimeFactor = head [y | y <- primes, isFactorOf y x]
      x' = x `div` nextPrimeFactor
      xs' = nextPrimeFactor:xs
