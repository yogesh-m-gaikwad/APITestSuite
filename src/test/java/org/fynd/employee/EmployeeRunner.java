package org.fynd.employee;

import com.intuit.karate.junit5.Karate;

class EmployeeRunner {

    @Karate.Test
    Karate testGetEmployees() {
        return Karate.run("classpath:employee/read/get-employees.feature");
    }

    @Karate.Test
    Karate testGetEmployeeById() {
        return Karate.run("classpath:employee/read/get-employee-by-id.feature");
    }

    @Karate.Test
    Karate testCreateEmployee() {
        return Karate.run("classpath:employee/create/create-employee.feature");
    }

    @Karate.Test
    Karate testUpdateEmployee() {
        return Karate.run("classpath:employee/update/update-employee.feature");
    }

    @Karate.Test
    Karate testReadUpdateEmployee() {
        return Karate.run("classpath:employee/update/read-update-employee.feature");
    }

    @Karate.Test
    Karate testDeleteEmployee() {
        return Karate.run("classpath:employee/delete/delete-employee.feature");
    }

    @Karate.Test
    Karate testCRUDEmployee() {
        return Karate.run("classpath:employee/crud/crud-employee.feature");
    }
}
