module Factors where

import Data.List

getFactors :: Int -> [Int]
getFactors x = 1 : [y | y <- [2..(x - 1)], isFactorOf y x] ++ [x]

isFactorOf :: Int -> Int -> Bool
isFactorOf x y = y `mod` x == 0

commonFactors :: Int -> Int -> [Int]
commonFactors x y = intersect (getFactors x) (getFactors y)
