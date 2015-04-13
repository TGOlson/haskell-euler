module Factors where

import Data.List

getFactors :: Int -> [Int]
getFactors x = [y | y <- [1..x], isFactorOf y x]

getPrimeFactors :: Int -> [Int]
getPrimeFactors = getPrimeFactorsWithContainer [1]

getPrimeFactorsWithContainer :: [Int] -> Int -> [Int]
getPrimeFactorsWithContainer xs 1 = xs
getPrimeFactorsWithContainer xs x = getPrimeFactorsWithContainer xs' x'
    where firstFactor = head [factor | factor <- [2..x], isFactorOf factor x]
          x' = x `div` firstFactor
          xs' = firstFactor:xs

isFactorOf :: Int -> Int -> Bool
isFactorOf x y = y `mod` x == 0

commonFactors :: Int -> Int -> [Int]
commonFactors x y = intersect (getFactors x) (getFactors y)
