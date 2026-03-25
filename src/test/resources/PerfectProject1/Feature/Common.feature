Feature: Common feature file for pet store

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * def postEndPoint = '/pet'
    * def getEndPoint = '/pet'
    * def putEndPoint = '/pet'
    * def deleteEndPoint = '/pet'

  @CreatePet
  Scenario: create a pet
    Given url baseUrl
    And path postEndPoint
    And request createPayload
    When method POST
    Then match responseStatus == statusCode


  @GetPet
  Scenario: get a pet
    Given url baseUrl
    And path getEndPoint + '/' + id
    When method GET
    Then match responseStatus == statusCode


  @UpdatePet
  Scenario: update a pet
    Given url baseUrl
    And path putEndPoint + '/' + id
    And request updatePayload
    When method PUT
    Then status 200

  @DeletePet
  Scenario: delete a pet
    Given url baseUrl
    And path deleteEndPoint + '/' + id
    When method DELETE
    Then status 204