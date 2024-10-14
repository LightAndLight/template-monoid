# `template-monoid`

A datatype for combining monoidal values with effects.

## Why?

The `Template` type defined in this library already exists in `base` as [`Ap`](https://hackage.haskell.org/package/base-4.12.0.0/docs/Data-Monoid.html#t:Ap).
I've created a new package because I think it deserves to stand on its own as a concept, with explanations and code examples.

The description of the `Ap` type is:

> This data type witnesses the lifting of a Monoid into an Applicative pointwise.

While accurate, this description is rather dry and doesn't spark my curiosity or gesture at potential uses for this datatype.
