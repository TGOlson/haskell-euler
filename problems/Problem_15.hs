-- Lattice paths
-- Problem 15
-- Starting in the top left corner of a 2×2 grid, and only being able to move
-- to the right and down, there are exactly 6 routes to the bottom right corner.
--
--
-- How many such routes are there through a 20×20 grid?

module Problem_15 where

factorials :: [Integer]
factorials = scanl (*) 1 [2..]

factorial :: Int -> Integer
factorial x = last $ take x factorials

lattice :: Int -> Int -> Integer
lattice x y = (factorial (x + y)) `div` ((factorial x) ^ 2)

problem15 :: Int
problem15 = fromInteger $ lattice 20 20
