{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Models.Person.SocialSecurityNumber where

import qualified Control.Exception as Exception
import qualified Data.Text as Text
import qualified Text.Regex as Regex
import qualified Witch

newtype SocialSecurityNumber = SocialSecurityNumber String

instance Witch.TryFrom String SocialSecurityNumber where
  tryFrom = Witch.maybeTryFrom validateSSN

instance Witch.From SocialSecurityNumber String

validateSSN :: String -> Maybe SocialSecurityNumber
validateSSN ssn =
  let regex = Regex.mkRegex "^(123-45-6789|XXX-XX-XXXX)$"
   in case Regex.matchRegex regex ssn of
        (Just _) -> Just $ SocialSecurityNumber ssn
        _ -> Nothing
