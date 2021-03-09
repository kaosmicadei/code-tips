module Main where

import Shor

main :: IO ()
main = mapM_ (print . factorize) [15, 35, 65, 91]