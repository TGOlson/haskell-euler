import Problem_1
import Problem_2

main = do
  printAnswerSolved 1 problem1 233168
  printAnswerSolved 2 problem2 4613732

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
