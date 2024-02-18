module Exceptions.InvalidPhoneNumber where

import qualified Control.Exception as Exception

newtype InvalidPhoneNumber = InvalidPhoneNumber String
  deriving (Show)

instance Exception.Exception InvalidPhoneNumber
