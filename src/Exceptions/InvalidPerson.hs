module Exceptions.InvalidPerson where

import qualified Control.Exception as Exception

newtype InvalidPerson = InvalidPerson String
  deriving (Show)

instance Exception.Exception InvalidPerson
