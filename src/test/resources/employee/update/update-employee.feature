Feature: Update Employee

    Background:
        * url apiUrl

    Scenario: Update an employee

        Given path 'update'
        And request read('update-employee.json')
        And header Accept = 'application/json'
        When method PUT
        Then status 200
        And match $ == read('result.json')