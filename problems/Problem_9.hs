-- Special Pythagorean triplet
-- Problem 9
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
--
-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
--
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

module Problem_9 where


type Triplet = (Int, Int, Int)


pythagoreanTriplets :: Int -> [Triplet]
pythagoreanTriplets n = [(a, b, c) | a <- [1..(n `div` 2 + 1)], b <- [a..n], c <- [b..n], isTriplet (a, b, c)]


isTriplet :: Triplet -> Bool
isTriplet (a, b, c) = a^2 + b^2 == c^2


pythagoreanTripletsWithSum :: Int -> [Triplet]
pythagoreanTripletsWithSum n = filter (\x -> tripletSum x == n) $ pythagoreanTriplets n


tripletSum :: Triplet -> Int
tripletSum (a, b, c) = a + b + c


tripletProduct :: Triplet -> Int
tripletProduct (a, b, c) = a * b * c


problem9 :: Int
problem9 = tripletProduct . head $ pythagoreanTripletsWithSum 1000
