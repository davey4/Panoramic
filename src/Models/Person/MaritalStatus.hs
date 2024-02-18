{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.MaritalStatus where

import qualified Control.Exception as Exception
import qualified Witch

data MaritalStatus = Single | Married

instance Witch.From MaritalStatus String where
  from timeFrame = case timeFrame of
    Single -> "Single"
    Married -> "Married"

instance Witch.TryFrom String MaritalStatus where
  tryFrom = Witch.maybeTryFrom $ \x -> case x of
    "Single" -> Just Single
    "Married" -> Just Married
    _ -> Nothing
