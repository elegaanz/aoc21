module Day1 (run, run2) where

import Utils

counter :: (Maybe Int, Int) -> Int -> (Maybe Int, Int)
counter (Nothing, count) i = (Just i, count)
counter (Just p, count) i = if p < i then
    (Just i, count + 1)
else
    (Just i, count)

run :: String -> IO ()
run input =
    let input' = Utils.parseIntList input
        (_, res) = foldl counter (Nothing, 0) input'
    in putStrLn $ show res

run2 :: String -> IO ()
run2 input =
    let input' = Utils.parseIntList input
        windows = generateWindows input' 3
        windowsSum = map (foldl (+) 0) windows
        (_, res) = foldl counter (Nothing, 0) windowsSum
    in putStrLn $ show res


-- stolen from https://github.com/jmleakakos/haskell-sliding-window/blob/master/SlidingWindow.hs
-- i'm too lazy to import a package just for that function
generateWindows :: [a] -> Int -> [[a]]
generateWindows list@(_:t) windowSize 
  | length list == windowSize = (window:[])
  | otherwise = (window:rest)
  where window = take windowSize list
        rest = generateWindows t windowSize
