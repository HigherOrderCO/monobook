module Base.AVLTree.Delete.delete-maximum where

open import Base.Bool.Bool
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.Balance.rotate-right
open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.empty
open import Base.AVLTree.AVLTree

-- Deletes the maximum element from an AVL tree, maintaining balance.
-- - tree: The AVL tree to delete from.
-- = A triple containing:
--    1. The removed maximum key-value pair (or None if the tree was empty).
--    2. The new AVL tree with the maximum element removed.
--    3. A boolean indicating whether the height of the tree decreased.
delete-maximum :
  ∀ {K V : Set} →
  {{_ : Ord K}} →
  AVLTree K V →
  Pair (Maybe (Pair K V)) (Pair (AVLTree K V) Bool)
delete-maximum Leaf = None , empty , False
delete-maximum (Node v    _       l Leaf)  = Some v , l , True
delete-maximum (Node curr balance l r) with delete-maximum r
... | (v , other , is-smaller) with (is-smaller , balance)
... | (False , _)   = v , (Node curr balance l other) , False
... | (True , +one) = v , (Node curr zero    l other) , True
... | (True , zero) = v , (Node curr -one    l other) , False
... | (True , -one) = do
  let (node , height) = rotate-right (Node curr -one l other)
  v , node , height

