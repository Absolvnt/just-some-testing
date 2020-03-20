{-# LANGUAGE StandaloneDeriving #-}

module Spec where

import Letter
import Test.Hspec
import Test.QuickCheck

instance Arbitrary Letter where
    arbitrary = (arbitrary :: Gen Int) >>= return . Letter

spec :: IO ()
spec = hspec $ do
    describe "Type Letter" $ do
        it "allows for letter arithmetic" $ do
            property $ \(Letter x) (Letter y) -> Letter x + Letter y `shouldBe` Letter (x + y)