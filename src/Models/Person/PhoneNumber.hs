{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.PhoneNumber where

import qualified Control.Exception as Exception
import qualified Data.Text as Text
import qualified Exceptions.InvalidPhoneNumber as InvalidPhoneNumber
import qualified Text.Regex as Regex
import qualified Witch

newtype PhoneNumber = PhoneNumber String

instance Witch.From String PhoneNumber

instance Witch.From PhoneNumber String

validatePhoneNumber :: String -> PhoneNumber
validatePhoneNumber pn =
  let regex = Regex.mkRegex "^(\\+\\d{1,2}\\s?)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$"
   in case Regex.matchRegex regex pn of
        (Just _) -> Witch.into pn
        _ -> Exception.throw $ InvalidPhoneNumber.InvalidPhoneNumber "Invalid Phone Number"
