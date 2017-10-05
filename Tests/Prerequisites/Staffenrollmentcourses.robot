*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Enroll staff to course only recommended
    [Tags]  Smoke
    Log in to ILP
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=691659&catalogId=664465
    sleep  5s
    page should contain element  id=course-book-staff-button
    click element  id=course-book-staff-button
    sleep  7s
    page should contain element  xpath=//span[@id='staffsList']/div/div
    click element  xpath=//span[@id='staffsList']/div/div/ul/li[3]
    sleep  5s
    click element  id=enrolment_dialog_prerequisite_checks-abortBtn
    sleep  10s
    page should contain element  xpath=//span[@id='staffsList']/div/div
    click element  xpath=//span[@id='staffsList']/div/div/ul/li[3]
    sleep  5s
    click element  id=enrolment_dialog_prerequisite_checks-form:enrolment_dialog_prerequisite_checks-actionBtn
    sleep  7s
    click element  xpath=//span[@id='staffsList']/div/div/ul/li[3]
    sleep  5s
    page should not contain element  id=enrolment_dialog_prerequisite_checks-abortBtn

Enroll staff to course required not met
    Log in to ILP
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=691693&catalogId=664465
    sleep  5s
    page should contain element  id=course-book-staff-button
    click element  id=course-book-staff-button
    sleep  7s
    page should contain element  xpath=//span[@id='staffsList']/div/div
    click element  xpath=//span[@id='staffsList']/div/div/ul/li[2]
    sleep  5s
    page should not contain element  id=enrolment_dialog_prerequisite_checks-form:enrolment_dialog_prerequisite_checks-actionBtn
    click element  id=enrolment_dialog_prerequisite_checks-abortBtn
    page should contain element  xpath=//span[@id='staffsList']/div/div
    click element  xpath=//span[@id='staffsList']/div/div/ul/li[2]
    sleep  5s
