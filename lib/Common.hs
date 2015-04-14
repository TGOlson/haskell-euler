module Common where

sections :: Int -> [Int] -> [[Int]]
sections n (x:xs)
  | length (x:xs) <= n = [x:xs]
  | otherwise = [x : (take (n - 1) xs)] ++ sections n xs

getRange :: Int -> Int -> [Int]
getRange x y
  | x >= y = [y..x]
  | otherwise = [x..y]
