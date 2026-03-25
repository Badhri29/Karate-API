Feature: Store Functionality

  Background:
    * def createPet = read('file:src/test/java/Sample/Mock/petPayload.json')
    * def createOrder = read('file:src/test/java/Sample/Mock/orderPayload.json')

  Scenario: Validate user can able to create pet and place order using created pet id
    * call read('file:src/test/java/Sample/Mock/Template.feature@Create_and_Place_Order'){ createPetPayload : '#(createPet)', createOrderPayload : '#(createOrder)'}