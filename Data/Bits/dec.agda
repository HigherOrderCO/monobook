module Data.Bits.dec where

open import Data.Bits.Type
open import Data.Bits.strip

-- Decrements a binary string by one.
-- - bs: The input binary string.
-- = The decremented binary string.
dec : Bits → Bits
dec E = O E
dec (O E) = O E
dec (I E) = O E 
dec (O bs) = strip (I (dec bs))
dec (I bs) = strip (O bs)
