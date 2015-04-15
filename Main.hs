import System.Environment

import MaybeAnswer

import Problem_1
import Problem_2
import Problem_3
import Problem_4
import Problem_5
import Problem_6
import Problem_7
import Problem_8
import Problem_9
import Problem_10
import Problem_11
import Problem_12
import Problem_13
import Problem_14
import Problem_15

data AnswerSet = AnswerSet Int (MaybeAnswer Int) (MaybeAnswer Int)

-- Note: solved answer values are provided by the Euler website
-- after a problem is successfully solved. They are included here
-- as protection against regression when refactoring
-- TODO: use a test framework

-- Reference for 1-10
-- https://wiki.haskell.org/Euler_problems/1_to_10

answerSets = [
    (AnswerSet 1  (Answer problem1)  (Answer 233168)),
    (AnswerSet 2  (Answer problem2)  (Answer 4613732)),
    (AnswerSet 3  (Answer problem3)  (Answer 6857)),
    (AnswerSet 4  (Answer problem4)  (Answer 906609)),
    (AnswerSet 5  (Answer problem5)  (Answer 232792560)),
    (AnswerSet 6  (Answer problem6)  (Answer 25164150)),
    (AnswerSet 7  (Answer problem7)  (Answer 104743)),
    (AnswerSet 8  (Answer problem8)  (Answer 23514624000)),
    (AnswerSet 9  (Answer problem9)  (Answer 31875000)),
    (AnswerSet 10 (Answer problem10) (Answer 142913828922)),
    (AnswerSet 11 (Answer problem11) (Answer 70600674)),
    (AnswerSet 12 (Answer problem12) (Answer 76576500)),
    (AnswerSet 13 (Answer problem13) (Answer 5537376230)),
    -- (AnswerSet 14 (Answer problem14) (Answer 837799)), -- runs slow
    (AnswerSet 15 (Answer problem15) (Answer 137846528820))
  ]

showAnswerFormatted :: AnswerSet -> String
showAnswerFormatted (AnswerSet n answer solution) =
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
