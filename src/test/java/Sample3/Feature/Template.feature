Feature: Template file

  @Create_Pet_And_Store
  Scenario: user can create pet and using the details create order in store
    * def createPetResponse = call read('file:src/test/java/Sample3/Feature/Common.feature@create_Pet') { createPetPayload : '#(createPetPayload)' }
    * karate.log(createPetResponse)

    * def createStoreResponse = call read('file:src/test/java/Sample3/Feature/Common.feature@create_Store') { createStorePayload : '#(createStorePayload)' }
    * karate.log(createStoreResponse)