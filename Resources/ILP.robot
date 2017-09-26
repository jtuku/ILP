*** Settings ***
Library  Selenium2Library

*** Variables ***
${START_URL} =  http://192.168.0.14:39900/ilp/
${SEARCH_TERM} =  eventcourse
${USER_NAME} =  eventtester
${PASSWORD} =  eventtester

*** Keywords ***
Open ILP
    Go To  ${START_URL}
    Sleep  5s
    Page should contain element  id=externalForm:login


Log in to ILP
    Go To  ${START_URL}
    Sleep  5s
    Input Text  id=externalForm:login  ${USER_NAME}
    Input Text  id=externalForm:password  ${PASSWORD}
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=NL_PERSONAL_DASHBOARD

Log out from ILP
    Page should contain element  id=NL_PERSONAL_DASHBOARD
    click element  xpath=//a[@id='NL_USERMENU']/span[3]
    Sleep  5s
    Click element  id=NL_LOGOUT
    Sleep  10s
