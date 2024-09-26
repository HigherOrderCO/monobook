open import Base.Trait.Show
open import Bend.Fun.Term.Term using (Term)

module Bend.Fun.MatchRule.show (TShow : Show Term) where

open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.show-bind
open import Base.Bool.if
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.String.eq
open import Base.List.List
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Maybe.fold
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module MatchRule = MatchRule' Term

instance
  ShowMatchRule : Show MatchRule
  ShowMatchRule = record { to-string = show-match-rule }
    where
      show-match-rule : MatchRule -> String
      show-match-rule (MkMatchRule name binds body) = do
        let binds-str = join " " (map show-bind binds)
        let name = fold "*" (λ n -> n) name
        name ++ (if binds-str == "" then "" else " " ++ binds-str) ++ ": " ++ show {{TShow}} body
