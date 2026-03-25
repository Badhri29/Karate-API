Feature: templateFeature

  @Create_and_Place_Order
  Scenario: Create and place order
    * def petResponses = call read('file:src/test/java/Sample/Mock/Common.feature@CreatePet'){createPet : '#(createPetPayload)'}
    * def petId = petResponses.response.id
    * karate.log(petId)

    * set createOrderPayload.petId = petId
    * def orderResponses = call read('file:src/test/java/Sample/Mock/Common.feature@CreateOrder'){createOrder : '#(createOrderPayload)'}
    * karate.log(orderResponses)