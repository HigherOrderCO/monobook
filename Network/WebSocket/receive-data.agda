module Network.WebSocket.receive-data where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IOAsync.Type

-- Receives data from a WebSocket connection.
-- - conn: The WebSocket connection to receive data from.
-- = A string containing the received data.
postulate
  receive-data : WSConnection → IOAsync String

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC receive-data = \conn -> (WS.receiveData conn) #-}
