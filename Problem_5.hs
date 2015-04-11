-- Smallest multiple
-- Problem 5
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

module Problem_5 where


-- Note: this should use the least common multiple principle instead of brute force


divisableByAll xs = head [x | x <- [20,40..], isDivisableByAll xs x]

isDivisableByAll xs x = all (\v -> isFactorOf v x) xs

isFactorOf x y = y `mod` x == 0


problem5 = divisableByAll [20,19..2]
