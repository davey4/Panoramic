module Models.EditablePerson where

data EditablePerson = EditablePerson
  { firstName :: Maybe String
  , lastName :: Maybe String
  , socialSecurityNumber :: Maybe String
  , maritalStatus :: Maybe String
  , usPhoneNumber :: Maybe String
  }
