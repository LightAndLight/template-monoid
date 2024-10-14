module Data.Monoid.Template
  ( Template(..)
  , (<.)
  , (.>)
  )
where

import Data.String (IsString(..))

newtype Template m a = Template{ runTemplate :: m a }

instance Functor m => Functor (Template m) where
  fmap f (Template ma) = Template (fmap f ma)

instance (Applicative m, Semigroup a) => Semigroup (Template m a) where
  Template ma <> Template ma' = Template (liftA2 (<>) ma ma')

instance (Applicative m, Monoid a) => Monoid (Template m a) where
  mempty = Template (pure mempty)

instance (Applicative m, IsString a) => IsString (Template m a) where
  fromString = Template . pure . fromString

(<.) :: Applicative m => Template m a -> m b -> Template m a
(<.) (Template ma) mb = Template (ma <* mb)

(.>) :: Applicative m => m b -> Template m a -> Template m a
(.>) mb (Template ma) = Template (mb *> ma)
