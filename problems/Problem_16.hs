-- Power digit sum
-- Problem 16
-- 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
-- What is the sum of the digits of the number 21000?

module Problem_16 where

sumOfDigits :: Integer -> Int
sumOfDigits = sum . map (read . (:[])) . show

problem16 :: Int
problem16 = sumOfDigits (2^1000)
