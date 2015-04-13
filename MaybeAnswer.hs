module MaybeAnswer where

-- data Answer = Answer a deriving (Eq)
--
-- type MaybeAnswer a = Maybe (Answer a)
--
-- None
-- (Just (Answer 5))
--
-- JustAnswer a :: a -> (Just (Answer a))
-- JustAnswer a = (Just (Answer a))
--
-- None
-- (JustAnswer 5)

data MaybeAnswer a = EmptyAnswer | Answer a deriving (Eq)

instance (Show a) => Show (MaybeAnswer a) where
  show EmptyAnswer = "No Answer"
  show (Answer x) = show x
