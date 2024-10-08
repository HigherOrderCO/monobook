module UG.SIPD.Action.eq where

import Base.String.eq as String
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.String.String
open import Base.Word8.to-nat
import Base.Nat.eq as Nat
open import UG.SIPD.Action.Action

-- Checks if two Action values are equal.
-- - a1: The fst Action.
-- - a2: The snd Action.
-- = True if the actions are equal, False otherwise.
eq : Action → Action → Bool
eq (SetNick t1 p1 s1) (SetNick t2 p2 s2) = (t1 Nat.== t2) && (p1 Nat.== p2) && (s1 String.== s2)

_==_ : Action → Action → Bool
_==_ = eq

infix 4 _==_

