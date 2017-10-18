*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Enroll programme only recommended
    [Tags]  Smoke
    Log in to ILP
    Go to  ${START_URL}pages/programmes.jsf#!/619369/490912
    sleep  10s
    page should contain element  xpath=//div[@id='course-description-main']/div[2]/a
    click element  xpath=//div[@id='course-description-main']/div[2]/a
    sleep  7s
    click element  xpath=//form[@id='revealData.actionId']/div/button[1]
    sleep  5s
    page should contain element  xpath=//div[@id='course-description-main']/div[2]/a
    click element  xpath=//div[@id='course-description-main']/div[2]/a
    sleep  7s
    click element  xpath=//form[@id='revealData.actionId']/div/button[2]
    sleep  9s
    page should contain element  xpath=//div[@id='Programmes']/div/div/curriculum-header/div/div/div/div/div/div[1]

