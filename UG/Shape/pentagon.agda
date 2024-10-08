module UG.Shape.pentagon where

open import Base.F64.ALL
open import Base.F64.F64
open import Base.List.List
open import Base.List.append
open import Base.List.map
open import Base.V2.V2
import Base.V2.sub as V2
open import UG.Shape.Shape

-- Approximation of pi
-- TODO: Replace with a more accurate representation if available
pi : F64
pi = 3.14159265359

-- Calculates a vertex of a regular pentagon relative to its center
-- - radius: The radius of the circumscribed circle.
-- - i: The index of the vertex (0 to 4).
-- = The calculated vertex position relative to the center (V2).
calculate-relative-vertex : F64 → F64 → V2
calculate-relative-vertex radius i =
  let angle = (2.0 * pi * i / 5.0) - (pi / 2.0)
  in MkV2 (radius * cos angle) (radius * sin angle)

-- Calculates the vertices of a regular pentagon relative to its center.
-- - side-length: The length of each side of the pentagon.
-- = A list of V2 points representing the pentagon vertices relative to the center.
calculate-pentagon-vertices : F64 → List V2
calculate-pentagon-vertices side-length = do
  let radius = side-length / (2.0 * sin (pi / 5.0))
  let angles = 0.0 :: 1.0 :: 2.0 :: 3.0 :: 4.0 :: []
  map (calculate-relative-vertex radius) angles

-- Creates a pentagon Shape centered at the given center with the given side length.
-- - center: The center point of the pentagon (V2).
-- - side-length: The length of each side of the pentagon.
-- = A Shape representing the pentagon.
pentagon : V2 → F64 → Shape
pentagon center side-length = do
  let vertices = calculate-pentagon-vertices side-length
  Polygon center vertices

