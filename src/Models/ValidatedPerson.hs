module Models.ValidatedPerson (
  module Models.ValidatedPerson,
  FirstName.FirstName,
  LastName.LastName,
  MaritalStatus.MaritalStatus,
  PhoneNumber.PhoneNumber,
  SocialSecurityNumber.SocialSecurityNumber,
)
where

import qualified Models.Person.FirstName as FirstName
import qualified Models.Person.LastName as LastName
import qualified Models.Person.MaritalStatus as MaritalStatus
import qualified Models.Person.PhoneNumber as PhoneNumber
import qualified Models.Person.SocialSecurityNumber as SocialSecurityNumber

data ValidatedPerson = ValidatedPerson
  { firstName :: FirstName.FirstName
  , lastName :: LastName.LastName
  , socialSecurityNumber :: SocialSecurityNumber.SocialSecurityNumber
  , maritalStatus :: MaritalStatus.MaritalStatus
  , usPhoneNumber :: PhoneNumber.PhoneNumber
  }
