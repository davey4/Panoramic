{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.LastName where

import qualified Witch

newtype LastName = LastName String

instance Witch.From String LastName

instance Witch.From LastName String
