-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
-- we can see that the 6th prime is 13.
--
-- What is the 10 001st prime number?


module Problem_7 where

import Primes

findNthPrimeNumber x = last . take x $ filter isPrime [1..]

problem7 :: Int
problem7 = findNthPrimeNumber 10001
