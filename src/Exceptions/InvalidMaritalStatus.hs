module Exceptions.InvalidMaritalStatus where

import qualified Control.Exception as Exception

newtype InvalidMaritalStatus = InvalidMaritalStatus String
  deriving (Show)

instance Exception.Exception InvalidMaritalStatus
