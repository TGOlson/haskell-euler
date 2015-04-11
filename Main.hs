import Problem_1
import Problem_2
import Problem_3
import Problem_4
import Problem_5

-- Note: solved answer values are provided by the Euler website
-- after a problem is successfully solved. They are included here
-- as protection against regression when refactoring

-- Reference for 1-10
-- https://wiki.haskell.org/Euler_problems/1_to_10


main = do
  printAnswerSolved 1 problem1 233168
  printAnswerSolved 2 problem2 4613732
  printAnswerSolved 3 problem3 6857
  printAnswerSolved 4 problem4 906609
  printAnswerSolved 5 problem5 232792560

printAnswer :: Show a => Int -> a -> IO ()
printAnswer n x = putStrLn $ showFormatted n x ++ " [unverified]"

printAnswerSolved :: (Show a, Eq a) => Int -> a -> a -> IO ()
printAnswerSolved n x expected = putStrLn $ showFormattedSolved n x expected

showFormatted :: Show a => Int -> a -> String
showFormatted n x = (showProblem n) ++ " - " ++ (show x)

showFormattedSolved :: (Show a, Eq a) => Int -> a -> a -> String
showFormattedSolved n x expected = (showFormatted n x) ++ " " ++ (showSolved x expected)

showProblem :: Int -> String
showProblem n = "Problem " ++ (show n)

showSolved :: Eq a => a -> a -> String
showSolved x y
  | x == y = "[solved]"
  | otherwise = "[unsolved]"
