module HaskellEuler.Problems
    ( answers
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


-- data Someanswer = forall a. SomeSolution a
--
-- s :: a -> Maybe SomeSolution
-- s = Just . SomeSolution

answers :: [Maybe Int]
answers =
    [ Just P1.answer
    , Just P2.answer
    , Just P3.answer
    , Just P4.answer
    , Just P5.answer
    , Just P6.answer
    , Just P7.answer
    , Just P8.answer
    , Just P9.answer
    , Just P10.answer
    , Just P11.answer
    , Just P12.answer
    , Just P13.answer
    , Just P14.answer
    , Just P15.answer
    , Just P16.answer
    , Nothing
    , Nothing
    , Nothing
    , Just P20.answer
    ]
