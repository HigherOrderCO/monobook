module Data.IO.Type where

postulate IO : Set → Set
{-# BUILTIN IO IO #-}
{-# COMPILE GHC IO = type IO #-}

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# COMPILE JS IO = function(x) { return x; } #-}
