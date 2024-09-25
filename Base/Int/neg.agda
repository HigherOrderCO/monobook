module Base.Int.neg where

open import Base.Int.Type
open import Base.Nat.Type
open import Base.Nat.sub

-- Negates an integer.
-- - x: The integer to negate.
-- = The negation of x.
neg : Int → Int
neg (Pos Zero)     = Pos Zero
neg (Pos (Succ n)) = NegSuc n
neg (NegSuc n)     = Pos (Succ n)
