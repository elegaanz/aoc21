module Day4 (run, run2) where

import Data.List.Split (splitOn)
import Data.List (find, transpose, (\\))
import Data.Maybe (listToMaybe)

-- row first matrix
type Board = [[Int]]

isWinning :: [Int] -> [Int] -> Bool
isWinning drawn = all (\n -> elem n drawn)

isWinningBoard :: [Int] -> Board -> Bool
isWinningBoard drawn board =
    let lines = board in
    let cols = transpose board in
    (any (isWinning drawn) lines) || (any (isWinning drawn) cols)

data Input = Input [Int] [Board] deriving Show

parseLine :: String -> [Int]
parseLine line = map read $ words line

parseBoard :: [String] -> Board
parseBoard = map parseLine

parseBoards :: ([Board], [String]) -> String -> ([Board], [String])
parseBoards (boards, lines) "" = (parseBoard lines : boards, [])
parseBoards (boards, lines) line = (boards, lines ++ [line])

parseNumbers :: String -> [Int]
parseNumbers line = map read $ splitOn "," line

parseInput :: String -> Input
parseInput input =
    let l = lines input in
    let numbers = parseNumbers $ head l in
    let (boards, _) = foldl parseBoards ([], []) $ tail $ tail (l ++ [""]) in
    Input numbers boards

findWinner :: Int -> Input -> ([Int], Board)
findWinner x (Input numbers boards) =
    let drawn = take x numbers in
    case find (isWinningBoard drawn) boards of
        Nothing -> findWinner (x + 1) (Input numbers boards)
        Just b -> (drawn, b)

findWinning :: [Int] -> Board -> [Int]
findWinning drawn b =
    let lines = b in
    let cols = transpose b in
    maybe (maybe (error "unreachable") id (find (isWinning drawn) cols)) id (find (isWinning drawn) lines)

run :: String -> IO ()
run input =
    let input' = parseInput input in
    let (drawn, winner) = findWinner 1 input' in
    let notDrawn = filter (\x -> not (elem x drawn)) (foldl (++) [] winner) in
    let sum = foldl (+) 0 notDrawn in
    putStrLn $ show (sum * (last drawn))

findWinner' :: Int -> Input -> Maybe ([Int], Board)
findWinner' x (Input numbers boards) =
    let drawn = take x numbers in
    let current = filter (isWinningBoard drawn) boards in
    let next = findWinner' (x + 1) (Input numbers (boards \\ current)) in
    let current' = fmap (\b -> (drawn, b)) $ listToMaybe current in 
    if x >= length numbers then
        current'
    else
        maybe current' Just next

run2 :: String -> IO ()
run2 input =
    let input' = parseInput input in
    let (drawn, winner) = maybe (error "no winner") id $ findWinner' 1 input' in
    let notDrawn = filter (\x -> not (elem x drawn)) (foldl (++) [] winner) in
    let sum = foldl (+) 0 notDrawn in
    putStrLn $ show (sum * (last drawn))
