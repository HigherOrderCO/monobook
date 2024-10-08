module UG.SIPD.Effect.move where

open import Base.String.String
open import Base.V2.V2
open import Base.Bool.Bool
open import UG.SIPD.Effect.Effect
open import UG.SIPD.Effect.EffectType
open import UG.SIPD.Effect.EffectReturn
open import Base.Pair.Pair
open import UG.SIPD.State.State
open import UG.SIPD.Body.Body
open import UG.SIPD.GameMap.GameMap
open import UG.SIPD.Player.Player

open import Base.Maybe.Maybe
open import Base.OrdMap.get
open import Base.OrdMap.insert
open import Base.String.Trait.Ord
open import Base.V2.V2
open import Base.V2.add
open import Base.V2.sub
open import Base.V2.normalize
open import Base.V2.length
open import Base.V2.mul-scalar
import UG.Shape.move as Shape
import UG.Shape.get-center as Shape
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.F64.lt
open import Base.Bool.if
open import Base.F64.min

move : Nat → String → Effect Bool State
move pid body-id state with get pid (State.players state) | get body-id (GameMap.bodies (State.game-map state))
... | None        | _         = state , False
... | _           | None      = state , False
... | Some player | Some body = do
  let bodies = (GameMap.bodies (State.game-map state))
  let hitbox = (Body.hitbox body)
  let hitbox-center = Shape.get-center hitbox
  let target = (Player.target player)
  let distance-to-target = target - hitbox-center
  let ln = length distance-to-target
  
  if (ln < 0.1)
    then state , False
    else do
      let constant-speed = 1.0
      let direction = normalize distance-to-target
      let movement = mul-scalar direction (min constant-speed ln)
      let new-center = hitbox-center + movement
      let new-hitbox = Shape.move hitbox movement 
      let updated-body = record body { hitbox = new-hitbox }
      let updated-bodies = insert (body-id , updated-body) bodies
      let updated-map = record (State.game-map state) { bodies = updated-bodies }
      let updated-state = record state { game-map = updated-map }
      updated-state , True

move-type : Nat → String → EffectType State
move-type pid body-id = (Boolean , (move pid body-id))

