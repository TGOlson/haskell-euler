module HaskellEuler.Problems.P20
    ( answer
    ) where

--
--   n! means n × (n − 1) × ... × 3 × 2 × 1
--
-- For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
-- and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
--
-- Find the sum of the digits in the number 100!

fact :: (Num a, Enum a) => a -> a
fact x = product [1..x]

sumDigits :: Int -> Int
sumDigits = sum . fmap (read . pure) . show

answer :: Int
answer = sumDigits $ fact 10
