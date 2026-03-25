Feature: common
  Scenario:
    Given url https://petstore.swagger.io/v2
    And path '/pet'
    And request read('file:src/test/java/Sample5Magesh/Document/postRequestBody.json')
    When method POST
    Then status 201