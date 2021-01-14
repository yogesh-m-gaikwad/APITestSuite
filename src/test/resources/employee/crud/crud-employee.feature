Feature: Create-Read-Update-Delete Employee

    Background:
        * url apiUrl

    Scenario: Create an employee and read the created record

        Given path 'create'
        And request read('new-employee.json')
        And header Accept = 'application/json'
        When method POST
        Then status 200
        And match $ == read('create-result.json')
        And def result = response

        Given path 'employee/' + result.data.id
        And header Accept = 'application/json'
        When method GET
        Then status 200
        And match $ == read('read-result.json')

        Given path 'update'
        And def updatedEmployee = result.data
        And set updatedEmployee.employee_age = 40
        And request updatedEmployee
        And header Accept = 'application/json'
        When method PUT
        Then status 200
        And match $ contains updatedEmployee

        Given path 'delete/' + result.data.id
        And header Accept = 'application/json'
        When method DELETE
        Then status 200
        And match $ == read('delete-result.json')