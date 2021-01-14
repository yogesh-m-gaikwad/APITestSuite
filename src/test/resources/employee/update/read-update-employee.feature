Feature: Read-Update Employee

    Background:
        * url apiUrl

    Scenario: Read and Update an employee

        Given path 'employee/' + 21
        And header Accept = 'application/json'
        When method GET
        Then status 200
        And match $ == read('read-result.json')
        And def result = response

        Given path 'update'
        And def updatedEmployee = result.data
        And set updatedEmployee.employee_age = 40
        And request updatedEmployee
        And header Accept = 'application/json'
        When method PUT
        Then status 200
        And match $ contains updatedEmployee