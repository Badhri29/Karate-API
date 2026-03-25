Feature: Create Functionality

  Background:
    * def updatePayload = read('file:src/test/java/Sample1/Document/updatePet.json')
    * def createValidPayload = read('file:src/test/java/Sample1/Document/CreatePet-valid.json')
    * def createInvalidPayload = read('file:src/test/java/Sample1/Document/CreatePet-Invalid.json')

  Scenario: Validate user able to create a new pet with valid payload and retrieve created pet.
    * call read('file:src/test/java/Sample/Feature/Template.feature@Create_With_ValidInput'){createRequestBody: '#(createValidPayload)'}

  Scenario: Validate user not able to create a new pet without send mandatory filed in request body.
    * call read('file:src/test/java/Sample/Feature/Template.feature@Create_With_InvalidInput'){createRequestBody: '#(createInvalidPayload)'}

  Scenario: Validate user able to get specific pet with valid id.
    * call read('file:src/test/java/Sample/Feature/Template.feature@GetPetWithValidID') { petId : '#(createValidPayload.id)'}

  Scenario: Validate user not able to get pet with invalid id.
    * call read('file:src/test/java/Sample/Feature/Template.feature@GetPetWithInvalidID') { petId : '#(createInvalidPayload.id)'}

