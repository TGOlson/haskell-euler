module Primes where

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = null . take 1 $ [y | y <- [2..(x `div` 2 + 1)], x `mod` y == 0]

-- alternate:
-- isPrime x = (== x) . head $ getPrimeFactors x
--
-- primes :: [Int]
-- primes = 2 : filter (null . tail . primeFactors) [3,5..]
--
-- primeFactors :: Int -> [Int]
-- primeFactors n = factor n primes
--   where
--     factor n (p:ps)
--         | p*p > n        = [n]
--         | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
--         | otherwise      =     factor n ps
