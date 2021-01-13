package org.fynd.employee;

import com.intuit.karate.junit5.Karate;

public class EmployeeRunner {

    @Karate.Test
    Karate testGetEmployee() {
        return Karate.run("classpath:employee/get-employees.feature");
    }
}
