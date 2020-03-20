{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Letter where

import Data.Char

newtype Letter = Letter Int deriving (Eq, Ord, Num)

instance Show Letter where
    show (Letter x) = show . chr $ (x `mod` 26) + ord 'a'

shift :: Int -> Letter -> Letter
shift = (+) . Letter