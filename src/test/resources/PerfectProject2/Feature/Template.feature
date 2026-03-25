Feature: template

  @createPet_and_createOrder
  Scenario: create pet and create store using the created pet details

    * def createPetResponse = call read('file:src/test/java/Sample4/Feature/Common.feature@createPet') {createPetPayload: '#(createPetPayload)'}
    * match createPetPayload.id == createPetResponse.response.id

    * def createStoreResponse = call read('file:src/test/java/Sample4/Feature/Common.feature@createStore') {createStorePayload: '#(createStorePayload)'}
    * match createStorePayload.id == createStoreResponse.response.id