module Utils (
    parseStrList,
    parseIntList
) where

import Data.String

parseStrList :: String -> [String]
parseStrList = Data.String.lines

parseIntList :: String -> [Int]
parseIntList s = map read $ parseStrList s
