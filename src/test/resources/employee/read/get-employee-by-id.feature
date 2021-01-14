Feature: get an employee using id

Background:
    * url apiUrl
    * def employeeUrl = 'employee/'

Scenario: get an employee with existing id

    Given path employeeUrl + 9
    When method GET
    Then status 200
    And match $ == read('employee-by-id.json')


Scenario: get an employee with non-existing id

    Given path employeeUrl + 2342349
    When method GET
    Then status 200
    And match $ == read('employee-by-invalid-id.json')