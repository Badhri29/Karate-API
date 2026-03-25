Feature: template

  Background:
    * def executionTime = 5000

  @Create_With_ValidInput
  Scenario: Create and Get pet with valid input
#    201
    * def createStatusCode = 200
    When def createResponse = call read('file:src/test/java/Sample/Feature/Common.feature@CreatePet'){ createPayload : '#(createRequestBody)', statusCode : #(createStatusCode)}
    Then match createResponse.response.id == createResponse.createPayload.id
    And match createResponse.response.name == createResponse.createPayload.name
    And assert createResponse.responseTime < executionTime

    * call read('file:src/test/java/Sample/Feature/Template.feature@GetPetWithValidID'){petId: #(createResponse.createPayload.id)}

  @Create_With_InvalidInput
  Scenario: Create pet with invalid input
#    400
    * def createStatusCode = 200
    When def createResponse = call read('file:src/test/java/Sample/Feature/Common.feature@CreatePet'){ createPayload : '#(createRequestBody)', statusCode : #(createStatusCode), executionTime : #(executionTime)}

  @GetPetWithValidID
  Scenario:
    * def getStatusCode = 200
    When def getResponse = call read('file:src/test/java/Sample/Feature/Common.feature@GetPet'){id: #(petId), statusCode : #(getStatusCode)}
    Then match getResponse.response.id == getResponse.id
    And assert getResponse.responseTime < executionTime

  @GetPetWithInvalidID
  Scenario:
#    404
    * def getStatusCode = 200
    * call read('file:src/test/java/Sample/Feature/Common.feature@GetPet'){id:#(petId), statusCode : #(getStatusCode)}
