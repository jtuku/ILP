*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Log in and log out from ILP as admin
    [Tags]  Special
    Go To  ${START_URL}
    Sleep  10s
    Input Text  id=externalForm:login  ${USER_NAME}
    Input Text  id=externalForm:password  ${PASSWORD}
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=NL_PERSONAL_DASHBOARD

Check ILSbridge
    [Tags]  Special
    Go To  ${START_URL}
    Sleep  10s
    Input Text  id=externalForm:login  ${USER_NAME}
    Input Text  id=externalForm:password  ${PASSWORD}
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=NL_PERSONAL_DASHBOARD
    Go To  ${START_URL}pages/ilsbridge.jsf?startPage=my_mailbox
    Set language to ENGB
    page should not contain  error
