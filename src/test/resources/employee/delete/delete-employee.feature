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