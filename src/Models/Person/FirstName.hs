{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.FirstName where

import qualified Witch

newtype FirstName = FirstName String

instance Witch.From String FirstName

instance Witch.From FirstName String
