@isTest
public with sharing class SampleTest {
    @isTest
    public static void testMeaningless_success() {

        Test.startTest();

        System.assert(true, 'This test should have passed');
        
        Test.stoptest();
    }
}