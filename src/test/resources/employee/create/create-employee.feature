Feature: Create Employee

    Background:
        * url apiUrl

    Scenario: Create an employee

        Given path 'create'
        And request read('new-employee.json')
        And header Accept = 'application/json'
        When method POST
        Then status 200
        And match $ == read('result.json')