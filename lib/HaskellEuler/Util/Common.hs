module HaskellEuler.Util.Common where

sections :: Int -> [Int] -> [[Int]]
sections _ [] = []
sections n (x:xs)
  | length (x:xs) <= n = [x:xs]
  | otherwise = (x : take (n - 1) xs) : sections n xs

getRange :: Int -> Int -> [Int]
getRange x y
  | x >= y = [y..x]
  | otherwise = [x..y]

square :: Int -> Int
square = (^ (2 :: Int))
