@isTest
public with sharing class SampleTest {
    @isTest
    public static void testApexGetDog_success() {

        Test.startTest();

        System.assert(true, 'This test should have passed');
        
        Test.stoptest();
    }
}