module Web.Worker.Types
  ( MessageEvent
  , MessagePort
  , Transferable
  , SendWrapper
  , class IsSendable
  , wrap
  , unwrap
  , unsafeWrap
  ) where

import Prelude

import Prim.RowList (class RowToList, RowList)
import Prim.RowList as Row
import Data.Newtype (class Newtype)

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
instance IsSendable Unit
instance IsSendable Void
instance IsSendable (SendWrapper a)

class IsSendableRowList (rl :: RowList Type)

instance IsSendableRowList Row.Nil
instance (IsSendable a, IsSendableRowList rest) => IsSendableRowList (Row.Cons sym a rest)

newtype SendWrapper a = SendWrapper a

wrap :: forall a b. Newtype a b => IsSendable b => a -> SendWrapper a
wrap = SendWrapper

unwrap :: forall a. SendWrapper a -> a
unwrap (SendWrapper a) = a

-- | Use with care. If you send something that isn't actually Sendable, it
-- | will raise an exception.
unsafeWrap :: forall a. a -> SendWrapper a
unsafeWrap = SendWrapper
