module Main where

import System.IO
import Text.Read
import Data.Char

stringOp :: Int -> String -> String
stringOp i s = (show i) ++ s

askInt :: String -> IO Int
askInt p = do
  putStrLn p
  i <- getLine
  case readMaybe i :: Maybe Int of
    Just int -> return int
    Nothing -> putStrLn "Not int!" >> askInt p

askMess :: String -> IO String
askMess p = putStrLn p >> getLine

stringOpIO :: IO String
stringOpIO = do
  step <- askInt "Int plz. "
  mess <- askMess "Text plz. "
  return $ stringOp step mess

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  stringOpIO >>= putStrLn
  return ()