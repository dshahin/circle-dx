@isTest
public with sharing class RandomDogController_Test {

    @isTest
    public static void testApexGetDog_success() {

        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(true));

        try {
            RandomDog.Dog dog = RandomDog.getDog();

            System.assertNotEquals(null, dog);
            System.assertEquals(dog.status, 'success');
            System.assertEquals(dog.message, 'https://images.dog.ceo/breeds/mix/Polo.jpg');

        } catch (Exception e) {

            System.assert(false, 'This test should have passed');
        }

        Test.stoptest();
    }

    @isTest static void testAuraGetDog_success() {

        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(true));

        try {
            String resString = RandomDogController.getDog();

            System.assertNotEquals(null, resString);

        } catch (Exception e) {

            System.assert(false, 'This test should have passed');
        }

        Test.stoptest();
    }

    @isTest static void testApexGetDog_fail() {

        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(false));

        try {
            RandomDog.Dog dog = RandomDog.getDog();

            System.assert(false, 'This test should have failed');

        } catch (Exception e) {

            System.assert(true, e.getMessage().contains('Bark! Could not access the API. Status:400'));
        }

        Test.stoptest();
    }

    @isTest static void testAuraGetDog_fail() {

        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(false));

        try {
            String resString = RandomDogController.getDog();

            System.assert(false, 'This test should have failed');

        } catch (Exception e) {

            System.assert(true, e instanceof AuraHandledException);
        }

        Test.stoptest();
    }
}
