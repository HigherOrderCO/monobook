module Data.Bool.not where

open import Data.Bool.Main

-- Negates a Boolean value.
-- - b: The input Boolean value.
-- = The negation of the input.
not : Bool → Bool
not true  = false
not false = true
