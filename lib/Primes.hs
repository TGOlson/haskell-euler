module Primes where

import Factors

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = null . take 1 $ [y | y <- [2..(sqrtInt x)], isFactorOf y x]

sqrtInt :: Int -> Int
sqrtInt = ceiling . sqrt . fromIntegral

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
