package org.fynd;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.json.support.Status;
import net.masterthought.cucumber.sorting.SortingMethod;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class CucumberReportsRunner {

    private final static Logger logger = LoggerFactory.getLogger(CucumberReportsRunner.class);

    public static void generateCucumberReport(String testOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(testOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        logger.debug("Total JSON paths: " + jsonFiles.size());
        jsonFiles.forEach(file -> logger.debug("File path: " + file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Employee Tests");
        config.setNotFailingStatuses(Collections.singleton(Status.SKIPPED));
        config.setSortingMethod(SortingMethod.ALPHABETICAL);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    @Test
    public void runCucumberReportTest() {
        Results results = Runner.path("classpath:employee").parallel(5);
        generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
