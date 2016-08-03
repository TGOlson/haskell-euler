-- Power digit sum
-- Problem 16
-- 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
--
-- What is the sum of the digits of the number 21000?

module HaskellEuler.Problems.P16
    ( answer
    ) where

sumOfDigits :: Integer -> Int
sumOfDigits = sum . map (read . (:[])) . show

answer :: Int
answer = sumOfDigits (2 ^(1000 :: Int))
