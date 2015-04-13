module Primes where

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = null . take 1 $ [y | y <- [2..(sqrtInt x)], x `mod` y == 0]

sqrtInt :: Int -> Int
sqrtInt = ceiling . sqrt . fromIntegral

takeNPrimeNumbers :: Int -> [Int]
takeNPrimeNumbers x = take x primes

nthPrimeNumber :: Int -> Int
nthPrimeNumber = last . takeNPrimeNumbers
