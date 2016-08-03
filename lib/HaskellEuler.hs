module HaskellEuler where

import System.Environment

import qualified HaskellEuler.Problems.P1  as P1
import qualified HaskellEuler.Problems.P2  as P2
import qualified HaskellEuler.Problems.P3  as P3
import qualified HaskellEuler.Problems.P4  as P4
import qualified HaskellEuler.Problems.P5  as P5
import qualified HaskellEuler.Problems.P6  as P6
import qualified HaskellEuler.Problems.P7  as P7
import qualified HaskellEuler.Problems.P8  as P8
import qualified HaskellEuler.Problems.P9  as P9
import qualified HaskellEuler.Problems.P10 as P10
import qualified HaskellEuler.Problems.P11 as P11
import qualified HaskellEuler.Problems.P12 as P12
import qualified HaskellEuler.Problems.P13 as P13
-- import qualified HaskellEuler.Problems.P14 as P14
import qualified HaskellEuler.Problems.P15 as P15
import qualified HaskellEuler.Problems.P16 as P16


data AnswerSet = AnswerSet Int (Maybe Int) (Maybe Int)

answerSets :: [AnswerSet]
answerSets =
    [ AnswerSet 1  (Just P1.answer)  (Just 233168)
    , AnswerSet 2  (Just P2.answer)  (Just 4613732)
    , AnswerSet 3  (Just P3.answer)  (Just 6857)
    , AnswerSet 4  (Just P4.answer)  (Just 906609)
    , AnswerSet 5  (Just P5.answer)  (Just 232792560)
    , AnswerSet 6  (Just P6.answer)  (Just 25164150)
    , AnswerSet 7  (Just P7.answer)  (Just 104743)
    , AnswerSet 8  (Just P8.answer)  (Just 23514624000)
    , AnswerSet 9  (Just P9.answer)  (Just 31875000)
    , AnswerSet 10 (Just P10.answer) (Just 142913828922)
    , AnswerSet 11 (Just P11.answer) (Just 70600674)
    , AnswerSet 12 (Just P12.answer) (Just 76576500)
    , AnswerSet 13 (Just P13.answer) (Just 5537376230)
    -- , AnswerSet 14 (Answer P14.answer) (Answer 837799)) -- runs slow
    , AnswerSet 14 Nothing Nothing
    , AnswerSet 15 (Just P15.answer) (Just 137846528820)
    , AnswerSet 16 (Just P16.answer) (Just 1366)
    , AnswerSet 17 Nothing               Nothing
    , AnswerSet 18 Nothing               Nothing
    , AnswerSet 19 Nothing               Nothing
    , AnswerSet 20 Nothing               Nothing
    ]

showAnswerFormatted :: AnswerSet -> String
showAnswerFormatted (AnswerSet n answer solution) =
  showProblem n ++ " - " ++
  show answer ++ " " ++
  showState answer solution

showProblem :: Int -> String
showProblem n = "Problem " ++ show n

showState :: Maybe Int -> Maybe Int -> String
showState Nothing _ = ""
showState _ Nothing = "[unverified]"
showState x y = if x == y then "[solved]" else "[unsolved]"


printAnswerSets :: [AnswerSet] -> IO ()
printAnswerSets = mapM_ printAnswerSet

printAnswerSet :: AnswerSet -> IO ()
printAnswerSet = putStrLn . showAnswerFormatted

printAnswerSetIndex :: Int -> IO ()
printAnswerSetIndex x = printAnswerSets [answerSets !! (x - 1)]

dispatch :: [String] -> IO ()
dispatch =
    \case "p":args -> printAnswerSetIndex . read $ head args
          _        -> printAnswerSets answerSets

main :: IO ()
main = getArgs >>= dispatch
