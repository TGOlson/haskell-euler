import System.Environment

import MaybeAnswer

import Problem_1
import Problem_2
import Problem_3
import Problem_4
import Problem_5

type AnswerSet = (Int, MaybeAnswer Int, MaybeAnswer Int)

-- Note: solved answer values are provided by the Euler website
-- after a problem is successfully solved. They are included here
-- as protection against regression when refactoring

-- Reference for 1-10
-- https://wiki.haskell.org/Euler_problems/1_to_10

answerSets = [
    (1, Answer problem1, Answer 233168),
    (2, Answer problem2, Answer 4613732),
    (3, Answer problem3, Answer 6857),
    (4, Answer problem4, Answer 906609),
    (5, Answer problem5, Answer 232792560),
    (6, EmptyAnswer, EmptyAnswer),
    (7, EmptyAnswer, EmptyAnswer),
    (8, EmptyAnswer, EmptyAnswer),
    (9, EmptyAnswer, EmptyAnswer),
    (10, EmptyAnswer, EmptyAnswer)
  ]

showAnswerFormatted :: AnswerSet -> String
showAnswerFormatted (n, answer, solution) =
  showProblem n ++ " - " ++
  show answer ++ " " ++
  showState answer solution

showProblem :: Int -> String
showProblem n = "Problem " ++ (show n)

showState :: Eq a => MaybeAnswer a -> MaybeAnswer a -> String
showState EmptyAnswer _ = ""
showState _ EmptyAnswer = "[unverified]"
showState x y = if x == y then "[solved]" else "[unsolved]"


printAnswerSets :: [AnswerSet] -> IO [()]
printAnswerSets = mapM $ printAnswerSet

printAnswerSet :: AnswerSet -> IO ()
printAnswerSet = putStrLn . showAnswerFormatted

printAnswerSetIndex :: Int -> IO [()]
printAnswerSetIndex x = printAnswerSets $ [answerSets !! (x - 1)]

dispatch :: [String] -> IO [()]
dispatch [] = printAnswerSets answerSets
dispatch ("p":args) = printAnswerSetIndex . read $ head args
-- Non-exhaustive pattern


main = do
  args <- getArgs
  dispatch args
