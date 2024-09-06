module Data.Bits.Test.inc where

open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.add renaming (add to add-nat; _+_ to _+n_)
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit increment
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Nat → Set
test-case n =
  let result = inc (from-nat n)
      expected = from-nat (n +n 1)
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case 0
    _ = unit
    _ : test-case 1
    _ = unit
    _ : test-case 2
    _ = unit
    _ : test-case 7
    _ = unit
    _ : test-case 15
    _ = unit
    _ : test-case 41
    _ = unit
    _ : test-case 99
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
