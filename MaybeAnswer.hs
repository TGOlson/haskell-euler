module MaybeAnswer where

data MaybeAnswer a = EmptyAnswer | Answer a deriving (Eq)

instance (Show a) => Show (MaybeAnswer a) where
  show EmptyAnswer = "No Answer"
  show (Answer x) = show x
