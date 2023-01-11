module Web.Worker.Types
  ( MessageEvent
  , MessagePort
  , Transferable
  , class IsSendable
  ) where

import Prim.RowList (class RowToList, RowList)
import Prim.RowList as Row

foreign import data Transferable :: Type
foreign import data MessagePort :: Type
foreign import data MessageEvent :: Type

class IsSendable (a :: Type)

instance IsSendable Boolean
instance IsSendable Int
instance IsSendable Number
instance IsSendable Char
instance IsSendable String
instance IsSendable a => IsSendable (Array a)
instance (RowToList r rl, IsSendableRowList rl) => IsSendable (Record r)

class IsSendableRowList (rl :: RowList Type)

instance IsSendableRowList Row.Nil
instance (IsSendable a, IsSendableRowList rest) => IsSendableRowList (Row.Cons sym a rest)
