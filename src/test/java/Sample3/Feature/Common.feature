Feature: Common file

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * def petEndPoint = '/pet'
    * def storeEndPoint = '/store/order'

  @create_Pet
  Scenario: create a pet
    Given url baseUrl
    And path petEndPoint
    And request createPetPayload
    When method POST
    Then status 200

  @create_Store
  Scenario: create a store
    Given url baseUrl
    And path storeEndPoint
    And request createStorePayload
    When method POST
    Then status 200