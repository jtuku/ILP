*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Enrolment course with notification
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=555049&catalogId=219815
    Sleep  7s
    page should contain element  id=course-order-button
    click element  id=course-order-button
    Sleep  5s
    page should contain element  id=enrolment_dialog_sf-form:enrolment_dialog_sf-abortBtn
    page should contain element  id=enrolment_dialog_sf-form:enrolment_dialog_sf-actionBtn
    click element  id=enrolment_dialog_sf-form:enrolment_dialog_sf-actionBtn
    Sleep  7s
    page should contain element  id=course-open-my-courses-button
    Go to  ${START_URL}pages/personalarea.jsf#!/mylearnings/pending
    Sleep  7s
    page should contain  SelfregistrationWithConfirmation1