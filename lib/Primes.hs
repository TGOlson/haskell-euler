module Primes where

import Data.Array.Unboxed
--
-- a :: (IArray a e, Ix i) => a i e
-- a = array (1,100) ((1,1) : [(i, i * a!(i-1)) | i <- [2..100]])

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

sieveArray :: Int -> UArray Int Bool
sieveArray n = listArray (1, n) (False:(replicate (n - 1) True))



-- let a = array (0, 3) (replicate 4 True) :: UArray Int Bool

-- Use list of bools
sieve :: Int -> [Int]
sieve = map fst . filter ((== True) . snd) . assocs . sieve' 2 . sieveArray

--
sieve' :: Int -> UArray Int Bool -> UArray Int Bool
sieve' n ps
  | n > uLength ps = ps
  | otherwise = sieve' (n + 1) nextPrimes
  where nextPrimes = replaceIndexFactorsOf n ps
  -- naive - uses n + 1 for next number to interigate, should use next 'true' value

uLength :: UArray Int Bool -> Int
uLength = length . elems

replaceIndexFactorsOf :: Int -> UArray Int Bool -> UArray Int Bool
replaceIndexFactorsOf n array = (//) array [(i, False) | i <- [(n * 2), (n * 3)..(uLength array)]]

reject :: (Int -> Bool) -> [Int] -> [Int]
reject f = filter $ not . f
