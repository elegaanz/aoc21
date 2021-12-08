module Day3 (run, run2) where

count :: Int -> Char -> String -> Int
count col ch str = if (str !! col) == ch then 1 else -1

countAll :: Int -> Char -> [String] -> Int
countAll col ch = foldl (\acc -> \x -> acc + (count col ch x)) 0

mapCols :: Char -> [String] -> [Int]
mapCols ch lines =
    let len = length (lines !! 0) in
    let cols = [0..len-1] in
    foldl (\list -> \col -> (countAll col ch lines) : list) [] cols

intFromBin :: [Int] -> Int
intFromBin bin =
    let power = \(pow, n) -> n*(2^pow) in
    let len = length bin in
    foldl (+) 0 $ map power $ zip [0..len-1] bin

normalize :: [Int] -> [Int]
normalize = map (\x -> if x < 0 then 0 else 1) 

inv :: [Int] -> [Int]
inv = map ((-) 0)

run :: String -> IO ()
run input = 
    let l = lines input in
    let counts = mapCols '1' l in
    let gamma = intFromBin $ normalize counts in
    let epsilon = intFromBin $ normalize $ inv counts in
    do
    putStr (show gamma)
    putStr " × "
    putStr (show epsilon)
    putStr " = "
    putStrLn $ show $ gamma * epsilon

rev :: [Int] -> [Int]
rev = map (\x -> if x == 0 then 1 else 0)

parseBin :: String -> [Int]
parseBin = map (\x -> if x == '0' then 0 else 1)

f :: (Int -> Int -> Bool) -> Int -> [String] -> [Int]
f _ _ [] = error "no matches"
f _ _ [x] = parseBin x
f op col lines =
    let total = length lines in
    let len = length $ head lines in
    let counter = countAll col '1' lines in
    let filterOp = if op 0 counter then (== '1') else (== '0') in
    if col >= len then
        error "no matches :(("
    else
        f op (col + 1) (filter (\l -> filterOp (l !! col)) lines)

run2 :: String -> IO ()
run2 input = do
    let l = lines input
    let oxy = intFromBin $ reverse $ f (<=) 0 l
    let co2 = intFromBin $ reverse $ f (>) 0 l 
    putStrLn $ show (oxy * co2)
