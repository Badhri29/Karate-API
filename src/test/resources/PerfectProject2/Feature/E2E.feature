Feature: Store Functionality

  Background:
    * def createPetPayload = read('file:src/test/java/Sample4/Document/createPetRequestBody.json')
    * def createStorePayload = read('file:src/test/java/Sample4/Document/createStoreRequestBody.json')

  Scenario Outline: validate user able to create pet and create order in store using created pet credential

    * set createPetPayload.id = <id>
    * set createPetPayload.name = '<name>'

    * set createStorePayload.id = <id>
    * set createStorePayload.petId = <id>
    * set createStorePayload.quantity = <qty>

    * call read('file:src/test/java/Sample4/Feature/Template.feature@createPet_and_createOrder') {createPetPayload: '#(createPetPayload)', createStorePayload: '#(createStorePayload)'}
    Examples:
      | id  | name      | qty |
      | 111 | badhri    | 5   |
#      | 222 | narayanan | 8   |