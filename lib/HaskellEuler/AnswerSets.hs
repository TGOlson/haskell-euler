module HaskellEuler.AnswerSets
    ( answerSets
    , AnswerSet(..)
    ) where


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
import qualified HaskellEuler.Problems.P14 as P14
import qualified HaskellEuler.Problems.P15 as P15
import qualified HaskellEuler.Problems.P16 as P16
import qualified HaskellEuler.Problems.P20 as P20

data AnswerSet
    = Answered Int Int
    | UnVerified Int
    | UnAnswered
    | Skip String AnswerSet


answerSets :: [AnswerSet]
answerSets =
    [ Answered P1.answer  233168
    , Answered P2.answer  4613732
    , Answered P3.answer  6857
    , Answered P4.answer  906609
    , Answered P5.answer  232792560
    , Answered P6.answer  25164150
    , Answered P7.answer  104743
    , Answered P8.answer  23514624000
    , Skip "slow" $ Answered P9.answer 31875000
    , Answered P10.answer 142913828922
    , Answered P11.answer 70600674
    , Answered P12.answer 76576500
    , Answered P13.answer 5537376230
    , Skip "slow" $ Answered P14.answer 837799
    , Answered P15.answer 137846528820
    , Answered P16.answer 1366
    , UnAnswered
    , UnAnswered
    , UnAnswered
    , Answered P20.answer 648
    ]
