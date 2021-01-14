Feature: Get an employee using id

Background:
    * url apiUrl
    * def employeeUrl = 'employee/'

Scenario: Get an employee with existing id

    Given path employeeUrl + 9
    When method GET
    Then status 200
    And match $ == read('employee-by-id.json')


Scenario: Get an employee with non-existing id

    Given path employeeUrl + 2342349
    When method GET
    Then status 404
    And match $.message contains 'Error Occured! Page Not found'


Scenario: Get an employee with invalid id

    Given path employeeUrl + 'uyij'
    When method GET
    Then status 404
    And match $.message contains 'Error Occured! Page Not found'