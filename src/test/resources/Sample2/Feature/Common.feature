Feature: common
  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * def postEndPointPetEnvironment = '/pet'
    * def postEndPointStoreEnvironment = '/store/order'

  @CreatePet
  Scenario: create pet
    Given url baseUrl
    And path postEndPointPetEnvironment
    And request createPet
    When method POST
    Then status 200

  @CreateOrder
  Scenario: create order
    Given url baseUrl
    And path postEndPointStoreEnvironment
    And request createOrder
    When method POST
    Then status 200