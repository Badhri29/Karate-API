Feature: Store Functionality

  Background:
    * def petRequestBody = read('file:src/test/java/Sample3/Document/createPetRequestBody.json')
    * def storeRequestBody = read('file:src/test/java/Sample3/Document/createStoreRequestBody.json')

  Scenario Outline: Validate user able to create order in store using created pet details
    * set petRequestBody.id = <id>
    * set petRequestBody.category.id = <categoryId>
    * set petRequestBody.category.name = '<categoryName>'
    * set petRequestBody.name = '<Name>'

    * set storeRequestBody.id = <id>
    * set storeRequestBody.petId = <categoryId>
    * set storeRequestBody.quantity = <qty>

    * call read('file:src/test/java/Sample3/Feature/Template.feature@Create_Pet_And_Store') { createPetPayload : '#(petRequestBody)', createStorePayload : '#(storeRequestBody)' }

    Examples:
      | id   | categoryId | categoryName | Name | qty |
      | 8195 | 1          | smallDog     | dog  | 2   |
      | 8195 | 2          | mediumDog    | dog  | 1   |
      | 9600 | 3          | smallCat     | cat  | 1   |
