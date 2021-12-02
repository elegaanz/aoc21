module Day2 (run, run2) where

import Utils

folder :: (Int, Int) -> [String] -> (Int, Int)
folder (pos, depth) ("forward" : x) = (pos + (read $ head x), depth)
folder (pos, depth) ("up" : x) = (pos, depth - (read $ head x))
folder (pos, depth) ("down" : x) = (pos, depth + (read $ head x))
folder _ _ = error "invalid line"

prod :: (Int, Int) -> Int
prod (x, y) = x * y

run :: String -> IO ()
run input =
    let lines = Utils.parseStrList input in
    let lines' = map words lines in
    putStrLn $ show $ prod $ foldl folder (0, 0) lines'

folder2 :: (Int, Int, Int) -> [String] -> (Int, Int, Int)
folder2 (pos, depth, aim) ("forward" : x) =
    let x' = read $ head x in
    (pos + x', depth + aim * x', aim)
folder2 (pos, depth, aim) ("up" : x) = (pos, depth, aim - (read $ head x))
folder2 (pos, depth, aim) ("down" : x) = (pos, depth, aim + (read $ head x))
folder2 _ _ = error "invalid line"

run2 :: String -> IO ()
run2 input = 
    let lines = Utils.parseStrList input in
    let lines' = map words lines in
    let (p, d, _) = foldl folder2 (0, 0, 0) lines' in
    putStrLn $ show $ prod (p, d) 
