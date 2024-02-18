module Exceptions.InvalidSocialSecurityNumber where

import qualified Control.Exception as Exception

newtype InvalidSocialSecurityNumber = InvalidSocialSecurityNumber String
  deriving (Show)

instance Exception.Exception InvalidSocialSecurityNumber
