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

-- primeFactors :: Int -> [Int]
-- primeFactors x = primeFactors' x [2..]
--   where primeFactors' x (p:ps)
--     | p*p > n = [n] -- n is a prime
--     | x `mod` p == 0 = primeFactors' (x `div` p)

getPrimeFactorsWithContainer :: [Int] -> Int -> [Int]
getPrimeFactorsWithContainer xs 1 = xs
getPrimeFactorsWithContainer xs x = getPrimeFactorsWithContainer xs' x'
    where
      nextPrimeFactor = head [factor | factor <- [2..x], isFactorOf factor x]
      x' = x `div` nextPrimeFactor
      xs' = nextPrimeFactor:xs
--
-- ceilingSqrt :: Int -> Int
-- ceilingSqrt x = ceiling . fromIntegral $ sqrt x
