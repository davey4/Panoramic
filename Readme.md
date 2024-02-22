# Panoramic

## Written in Haskell

### Dependencies Used
- witch
- regex-compat

--- 
I used `Witch` to help define the `from` and `tryFrom` instances for validating a string into a valid `SSN`, `PhoneNumber` and `Marital Status`

It's organized in a way that the `Person` fields are reusable across a `ValidatedPerson` and `EditablePerson`.
