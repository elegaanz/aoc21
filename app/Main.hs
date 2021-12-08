module Main where

import System.Environment
import System.IO
import System.CPUTime
import Text.Printf
import Data.List
import Day1
import Day2
import Day3
import Day4
import Day5
import Day6
import Day7
import Day8
import Day9
import Day10
import Day11
import Day12
import Day13
import Day14
import Day15
import Day16
import Day17
import Day18
import Day19
import Day20
import Day21
import Day22
import Day23
import Day24
import Day25

main :: IO ()
main = do
  args <- getArgs
  let day = head args
  let part = head $ tail args 
  let input = "inputs/" ++ day
  handle <- System.IO.openFile input System.IO.ReadMode
  contents <- System.IO.hGetContents handle
  start <- getCPUTime
  case (day, part) of
    ("1", "1") -> Day1.run contents
    ("1", "2") -> Day1.run2 contents
    ("2", "1") -> Day2.run contents
    ("2", "2") -> Day2.run2 contents
    ("3", "1") -> Day3.run contents
    ("3", "2") -> Day3.run2 contents
    ("4", "1") -> Day4.run contents
    ("4", "2") -> Day4.run2 contents
    ("5", "1") -> Day5.run contents
    ("5", "2") -> Day5.run2 contents
    ("6", "1") -> Day6.run contents
    ("6", "2") -> Day6.run2 contents
    ("7", "1") -> Day7.run contents
    ("7", "2") -> Day7.run2 contents
    ("8", "1") -> Day8.run contents
    ("8", "2") -> Day8.run2 contents
    ("9", "1") -> Day9.run contents
    ("9", "2") -> Day9.run2 contents
    ("10", "1") -> Day10.run contents
    ("10", "2") -> Day10.run2 contents
    ("11", "1") -> Day11.run contents
    ("11", "2") -> Day11.run2 contents
    ("12", "1") -> Day12.run contents
    ("12", "2") -> Day12.run2 contents
    ("13", "1") -> Day13.run contents
    ("13", "2") -> Day13.run2 contents
    ("14", "1") -> Day14.run contents
    ("14", "2") -> Day14.run2 contents
    ("15", "1") -> Day15.run contents
    ("15", "2") -> Day15.run2 contents
    ("16", "1") -> Day16.run contents
    ("16", "2") -> Day16.run2 contents
    ("17", "1") -> Day17.run contents
    ("17", "2") -> Day17.run2 contents
    ("18", "1") -> Day18.run contents
    ("18", "2") -> Day18.run2 contents
    ("19", "1") -> Day19.run contents
    ("19", "2") -> Day19.run2 contents
    ("20", "1") -> Day20.run contents
    ("20", "2") -> Day20.run2 contents
    ("21", "1") -> Day21.run contents
    ("21", "2") -> Day21.run2 contents
    ("22", "1") -> Day22.run contents
    ("22", "2") -> Day22.run2 contents
    ("23", "1") -> Day23.run contents
    ("23", "2") -> Day23.run2 contents
    ("24", "1") -> Day24.run contents
    ("24", "2") -> Day24.run2 contents
    ("25", "1") -> Day25.run contents
    ("25", "2") -> Day25.run2 contents
    _ -> error "pas encore codé"
  end <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^12)
  printf "Done in %0.3f sec\n" (diff :: Double)
