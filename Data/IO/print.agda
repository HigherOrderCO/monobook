module Data.IO.print where

open import Data.IO.Type
open import Data.Unit.Type
open import Data.String.Type

postulate
  print : String → IO Unit

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

{-# COMPILE GHC print = Text.putStrLn #-}
{-# COMPILE JS print = function(x) { return function() { console.log(x); }; } #-}
