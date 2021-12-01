module Main where

import System.Environment
import System.IO
import Data.List
import Day1

main :: IO ()
main = do
  args <- getArgs
  let day = head args
  let part = head $ tail args 
  let input = "inputs/" ++ day ++ "." ++ part
  handle <- System.IO.openFile input System.IO.ReadMode
  contents <- System.IO.hGetContents handle
  case (day, part) of
    ("1", "1") -> Day1.run contents
    ("1", "2") -> Day1.run2 contents
    _ -> error "pas encore codé"
