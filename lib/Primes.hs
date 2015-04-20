module Primes where

import Data.Array.Unboxed

type SieveArray = UArray Int Bool


primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = null . take 1 $ [y | y <- [2..(sqrtInt x)], x `mod` y == 0]

sqrtInt :: Int -> Int
sqrtInt = ceiling . sqrt . fromIntegral

takePrimes :: Int -> [Int]
takePrimes x = take x primes

nthPrimeNumber :: Int -> Int
nthPrimeNumber = last . takePrimes

takePrimesBelow :: Int -> [Int]
takePrimesBelow = map fst . filter ((== True) . snd) . assocs . sieve 2 . sieveArray

sieveArray :: Int -> SieveArray
sieveArray n = listArray (1, n) (False: replicate (n - 1) True)

sieveLength :: SieveArray -> Int
sieveLength = snd . bounds

sieve :: Int -> SieveArray -> SieveArray
sieve n ps
  | n > sqrtInt (sieveLength ps) = ps
  | otherwise = sieve (nextFactor n nextPrimes) nextPrimes
  where nextPrimes = replaceIndexFactorsOf n ps

replaceIndexFactorsOf :: Int -> SieveArray -> SieveArray
replaceIndexFactorsOf n a = (//) a [(i, False) | i <- [(n * 2), (n * 3)..(sieveLength a)]]

nextFactor :: Int -> SieveArray -> Int
nextFactor n ps
  | n > sqrtInt (sieveLength ps) = n + 1
  | ps ! (n + 1) = n + 1
  | otherwise = nextFactor (n + 1) ps
