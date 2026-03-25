Feature: common

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * def petEndPoint = '/pet'
    * def storeEndPoint = '/store/order'

  @createPet
  Scenario:
    Given url baseUrl
    And path '/pet/0'
    When method GET
    Then status 200

  @createStore
  Scenario:
    Given url baseUrl
    And path storeEndPoint
    And request createStorePayload
    When method POST
    Then status 200