module Spec where

import Test.Hspec
import Test.QuickCheck

onlyBools :: Gen Bool
onlyBools = elements [True]

spec :: IO ()
spec = hspec $ do
    describe "nothing" $ do
        it "does nothing" $ do
            forAll onlyBools $ \x -> x `shouldBe` True