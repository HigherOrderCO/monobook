module Bend.Net.show where

open import Base.String.String
open import Base.String.append
open import Base.Nat.Nat
open import Base.Nat.Trait.Show
open import Base.BinMap.to-list
open import Base.Pair.Pair
open import Base.Bits.Bits
open import Base.Bits.to-nat
open import Base.List.foldr
open import Base.List.map
open import Bend.Net.Net
open import Bend.Net.Node.Node
open import Bend.Net.Node.show
open import Base.Trait.Show

instance
  ShowNet : Show Net
  ShowNet = record { to-string = show-net }
    where
      show-net : Net → String
      show-net (MkNet nodes len name) =
        let nodes = foldr append "" (map show-node-entry (to-list nodes)) in
        "@" ++ name ++ " =\n" ++ nodes
        where
          show-node-entry : (Pair Bits Node) → String
          show-node-entry (id , node) =
            show (to-nat id) ++ ": " ++ show node ++ "\n"

