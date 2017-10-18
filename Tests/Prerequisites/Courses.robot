*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Enroll course only recommended
    [Tags]  Smoke
    Log in to ILP
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=691659&catalogId=664465
    sleep  10s
    page should contain element  id=course-register-button
    click element  id=course-register-button
    sleep  7s
    click element  id=enrolment_dialog_prerequisite_checks-abortBtn
    sleep  5s
    page should contain element  id=course-register-button
    click element  id=course-register-button
    sleep  7s
    click element  id=enrolment_dialog_prerequisite_checks-form:enrolment_dialog_prerequisite_checks-actionBtn
    sleep  9s
    page should contain element  xpath=//div[@id='courseroom']/div/div[1]/div/div[1]/div/div/div/div/div[2]/div[2]/div[3]/div/button[3]

Enroll course required not fulfilled
    [Tags]  Smoke
    Log in to ILP
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=691693&catalogId=664465
    sleep  10s
    page should contain element  id=course-register-button
    click element  id=course-register-button
    sleep  7s
    page should not contain element  id=enrolment_dialog_prerequisite_checks-form:enrolment_dialog_prerequisite_checks-actionBtn
    click element  id=enrolment_dialog_prerequisite_checks-abortBtn
    sleep  5s
    page should contain element  id=course-register-button