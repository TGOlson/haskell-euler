module HaskellEuler.Problems.P22
    ( answer
    ) where

import Data.Monoid
import System.IO.Unsafe
import Data.List
-- import Data.List.Split


-- Using names.txt (right click and 'Save Link/Target As...'),
-- a 46K text file containing over five-thousand first names,
-- begin by sorting it into alphabetical order.
-- Then working out the alphabetical value for each name,
-- multiply this value by its alphabetical position in the list to obtain a name score.
--
-- For example, when the list is sorted into alphabetical order,
-- COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
-- So, COLIN would obtain a score of 938 × 53 = 49714.
--
-- What is the total of all the name scores in the file?

-- kinda gross cheating... but w/e
-- could also use template haskell to inline the file...
{-# NOINLINE namesRaw #-}
namesRaw :: [String]
namesRaw = unsafePerformIO $ do
    raw <- readFile "data/p022_names.txt"
    return $ read $ "[" <> raw <> "]"

-- Kinda also wonky, but 'A' -> 65, 'Z' -> 90
-- capitalization matters, but we know the name list is all capitals, so we cool
charNum :: Char -> Int
charNum = (\i -> i - 64) . fromEnum

nameScore :: String -> Int
nameScore = sum . fmap charNum

nameScores :: [Int]
nameScores = zipWith (\x i -> nameScore x * i) (sort namesRaw) [1..]

answer :: Int
answer = sum nameScores
