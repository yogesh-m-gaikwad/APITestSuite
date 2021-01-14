# Employee Dummy API Tests
API Test Suite: Task: Automation Engineer

### Running the tests

The test runners are orgnized in src/test/java org.fynd package

The runner EmployeeRunner will allow you to run the tests without cucumber reports.
The karate reports will be generated in `target\surefire-reports\` folder

To generate Cucumber Reports utilize CucumberReportsRunner

#### Running the CucumberReportsRunner test
##### From IntelliJ Community

Right click on `/test/java/org.fynd.CucumberReportsRunner` and select "Run CucumberReportsRunner"

The reports will be generated in `target\cucumber-html-reports\` folder

#### Note: IntelliJ Community
The features are moved to test-resources as intelliJ Community did not copy them to the test classes.

Ensure project is build before you are running mvn test command from terminal and the features are copied correctly

### References

* [Karate](https://github.com/intuit/karate) github repo
* [Cucumber Reports](https://github.com/damianszczepanik/cucumber-reporting) github repo
