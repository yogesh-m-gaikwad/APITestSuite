Feature: Delete Employee

  Background:
    * url apiUrl
    * def baseUrl = 'employee/delete/'

  Scenario: Delete an employee

    Given path baseUrl + 10
    And header Accept = 'application/json'
    When method DELETE
    Then status 200
    And match $ == read('result.json')

  Scenario: Delete a non-existent employee attempt

    Given path baseUrl + 456456
    And header Accept = 'application/json'
    When method DELETE
    Then status 404
    And match $.message contains 'Error Occured! Page Not found'

  Scenario: Delete an invalid id attempt

    Given path baseUrl + 'abdf'
    And header Accept = 'application/json'
    When method DELETE
    Then status 404
    And match $.message contains 'Error Occured! Page Not found'