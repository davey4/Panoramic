module Validation where

import qualified Control.Exception as Exception
import qualified Exceptions.InvalidMaritalStatus as InvalidMaritalStatus
import qualified Exceptions.InvalidPerson as InvalidPerson
import qualified Models.EditablePerson as EditablePerson
import qualified Models.Person.PhoneNumber as PhoneNumber
import qualified Models.Person.SocialSecurityNumber as SocialSecurityNumber
import qualified Models.ValidatedPerson as ValidatedPerson
import qualified Witch

validatePerson :: EditablePerson.EditablePerson -> ValidatedPerson.ValidatedPerson
validatePerson p =
  case ( EditablePerson.firstName p
       , EditablePerson.lastName p
       , EditablePerson.socialSecurityNumber p
       , EditablePerson.maritalStatus p
       , EditablePerson.usPhoneNumber p
       ) of
    (Just fn, Just ln, Just ssn, Just ms, Just pn) ->
      ValidatedPerson.ValidatedPerson
        { ValidatedPerson.firstName = Witch.from fn
        , ValidatedPerson.lastName = Witch.from ln
        , ValidatedPerson.socialSecurityNumber = SocialSecurityNumber.validateSSN $ Witch.into ssn
        , ValidatedPerson.maritalStatus = case Witch.tryFrom ms of
            Left _ -> Exception.throw $ InvalidMaritalStatus.InvalidMaritalStatus "Invalid Marital Status"
            Right x -> x
        , ValidatedPerson.usPhoneNumber = PhoneNumber.validatePhoneNumber $ Witch.into pn
        }
    _ -> Exception.throw $ InvalidPerson.InvalidPerson "Invalid Person. All fields are required"

validatedPersonToEditablePerson :: ValidatedPerson.ValidatedPerson -> EditablePerson.EditablePerson
validatedPersonToEditablePerson p =
  EditablePerson.EditablePerson
    { EditablePerson.firstName = Just . Witch.from $ ValidatedPerson.firstName p
    , EditablePerson.lastName = Just . Witch.from $ ValidatedPerson.lastName p
    , EditablePerson.socialSecurityNumber = Just . Witch.from $ ValidatedPerson.socialSecurityNumber p
    , EditablePerson.maritalStatus = Just . Witch.from $ ValidatedPerson.maritalStatus p
    , EditablePerson.usPhoneNumber = Just . Witch.from $ ValidatedPerson.usPhoneNumber p
    }
