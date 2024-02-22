{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.PhoneNumber where

import qualified Control.Exception as Exception
import qualified Data.Text as Text
import qualified Text.Regex as Regex
import qualified Witch

newtype PhoneNumber = PhoneNumber String

instance Witch.TryFrom String PhoneNumber where
  tryFrom = Witch.maybeTryFrom validatePhoneNumber

instance Witch.From PhoneNumber String

validatePhoneNumber :: String -> Maybe PhoneNumber
validatePhoneNumber pn =
  let regex = Regex.mkRegex "^(\\+\\d{1,2}\\s?)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$"
   in case Regex.matchRegex regex pn of
        (Just _) -> Just $ PhoneNumber pn
        _ -> Nothing
