data Free f a =
  Done a
  | More (f (Free f a))