module Primes where

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = null . take 1 $ [y | y <- [2..(sqrtInt x)], x `mod` y == 0]

sqrtInt :: Int -> Int
sqrtInt = ceiling . sqrt . fromIntegral

takePrimes :: Int -> [Int]
takePrimes x = take x primes

takePrimesBelow :: Int -> [Int]
takePrimesBelow x = takeWhile (< x) primes

nthPrimeNumber :: Int -> Int
nthPrimeNumber = last . takePrimes

-- Use list of bools
sieve :: [Int] -> [Int]
sieve = sieve'

sieve' :: [Int] -> [Int]
sieve' [] = []
sieve' (p:ps) = p : (sieve' (reject (\x -> x `mod` p == 0) ps))

reject :: (Int -> Bool) -> [Int] -> [Int]
reject f = filter $ not . f
