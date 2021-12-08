#!/usr/bin/env bash

for d in $(seq 1 25); do
    echo import Day$d
done

echo

for d in $(seq 1 25); do
    if [ ! -f src/Day$d.hs ]; then
        echo "| (\"$d\", \"1\") -> Day$d.run"
        echo "| (\"$d\", \"2\") -> Day$d.run2"

        cat << EOF > src/Day$d.hs
module Day$d (run, run2) where

run :: String -> IO ()
run input = error "todo"

run2 :: String -> IO ()
run2 input = error "todo"
EOF
    fi
done
