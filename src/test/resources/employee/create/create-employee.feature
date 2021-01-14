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

    Scenario: Attempt to Create an employee with existing id

        Given path 'create'
        And request read('new-employee-with-existing-id.json')
        And header Accept = 'application/json'
        When method POST
        Then status 200
        And match $ == read('result.json')

    Scenario: Attempt to Create an employee blank name

        Given path 'create'
        And request read('new-employee-with-blank-name.json')
        And header Accept = 'application/json'
        When method POST
        Then status 200
        And match $.status != 'success'