module HVM.Run.evaluate where

open import HVM.Net.Net
open import HVM.Term.Term
open import HVM.Run.Run
open import HVM.Run.State.State
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.normalize
open import HVM.Run.state-get
open import HVM.Run.materialize
open import HVM.Run.State.boot
open import Base.Pair.Pair

-- Normalizes a Net into a Term
evaluate : Net → Term
evaluate net = snd (result (boot net)) where
  result : Run Term
  result = do
    normalize
    state ← state-get
    term  ← materialize (Net.root (State.gnet state))
    pure term

