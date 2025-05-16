# Pre-requisites

- Finished bubble sort algorithm implementation in Practical 1
- Pipeline simulator "JSimPipeline.jar" (USTH Moodle)

# Objective

- Analyze program executed in instruction pipeline

# Background

- Naive pipeline mode: run pipeline without concerning of instruction dependent
- Nb of exec stages: allow to modify number of exec stages in pipeline

# Tasks

- Execute bubble sort algorithm by pipeline simulator
- Validate the correctness of program with and without naive mode
- Analyze the execution of bubble algorithm in pipeline:
    - Note if the execution is correct or not
    - Capture case when two instructions are dependents and understand what happens
    - Capture case when a branch is executed and understand what happens
    - Note the number of cycles which are lost during the execution with different number of pipeline stages

# Submission

- Write the report to express your work on above task
- The report answer above question by text together with captured image for illustration
- Push the report together with your bubble sort algorithm implementation asm file to a directory
- Zip that directory to "<Student-Id>-<Student-Name>-Prac2.zip"
- Submit the zip file to Practical 2 in usth moodle on time