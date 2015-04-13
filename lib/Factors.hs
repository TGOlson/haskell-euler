module Factors where

import Data.List

import Primes

getFactors :: Int -> [Int]
getFactors x = 1 : [y | y <- [2..(x - 1)], isFactorOf y x] ++ [x]

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
