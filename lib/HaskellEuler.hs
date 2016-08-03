module HaskellEuler where

import Data.Monoid
import System.Environment
import HaskellEuler.AnswerSets

showAnswerFormatted :: Int -> AnswerSet -> String
showAnswerFormatted n answerSet =
    mconcat [ "Problem ", show n, " - "
            , showAnswer answerSet, " "
            , showTag answerSet
            ]

showAnswer :: AnswerSet -> String
showAnswer = \case Answered x _ -> show x
                   UnVerified x -> show x
                   _            -> ""

showTag :: AnswerSet -> String
showTag = \case Answered x y | x == y -> "[solved]"
                Answered _ _          -> "[unsolved]"
                UnVerified _          -> "[unverified]"
                UnAnswered            -> ""
                Skip reason _         -> "[skipping - " <> reason <> "]"



printAnswerSets :: [AnswerSet] -> IO ()
printAnswerSets = mapM_ putStrLn . zipWith showAnswerFormatted [1..]


printAnswerSetIndex :: Int -> IO ()
printAnswerSetIndex x = putStrLn $ showAnswerFormatted x $ answerSets !! (x - 1)

main :: IO ()
main = getArgs >>= \case
    "p":x:_ -> printAnswerSetIndex (read x)
    _       -> printAnswerSets answerSets
