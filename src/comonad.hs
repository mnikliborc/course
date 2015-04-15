class Functor => Comonad f where
  copure :: f a -> a
  (<<=) :: 
    (f a -> b)
    (f a) ->
    (f b)

data Store a b =
  Store (a -> b) a

instance Functor (Store t) where
  -- (a -> b) ->     f   a ->     f   b
  -- (a -> b) -> Store t a -> Store t b
  fmap f (Store s g) =
    -- s :: t -> a
    -- f :: a -> b
    -- ? :: t -> b
    Store (f . s) g

instance Comonad (Store t) where
  -- copure ::     f   a -> a
  -- copure :: Store t a -> a
  copure Store (s g) = 
    s g
    -- (    f   a -> b) ->     f   a ->     f   b
    -- (Store t a -> b) -> Store t a -> Store t b
    -- s :: t -> a
    -- g :: a
    -- f :: Store t a -> b
    f <<= Store s g = 
      Store (\t -> f (Store (const (s t)) t)) g
      Store (?) (f (Store s g))

data Lens t r =
  Lens (t -> Store r t)

p (addressLens . streetLens) reverse
