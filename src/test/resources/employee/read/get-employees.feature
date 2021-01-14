Feature: get all employees end-point

Background:
    * url apiUrl

Scenario: get all employees list

    Given path 'employees'
    When method get
    Then status 200
    And match $ == read('employees.json')