-- Largest prime factor
-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?

module Problem_3 where

largestPrimeFactor :: Int -> Int
largestPrimeFactor = maximum . getFactors

getFactors :: Int -> [Int]
getFactors = getFactorsWithContainer []

getFactorsWithContainer xs 1 = xs
getFactorsWithContainer xs x = getFactorsWithContainer xs' x'
    where firstFactor = head [factor | factor <- [2..x], isFactorOf factor x]
          x' = x `div` firstFactor
          xs' = firstFactor:xs

isFactorOf x y = y `mod` x == 0


problem3 = largestPrimeFactor 600851475143
