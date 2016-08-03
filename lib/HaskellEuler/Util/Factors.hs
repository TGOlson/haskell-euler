module HaskellEuler.Util.Factors where

import Data.List

import HaskellEuler.Util.Primes

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
commonFactors x y = getFactors x `intersect` getFactors y

primeFactors :: Int -> [Int]
primeFactors 1 = []
primeFactors x = factor : primeFactors (x `div` factor)
  where factor = head [y | y <- primes, isFactorOf y x]
