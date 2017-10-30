*** Settings ***
Library  Selenium2Library

*** Variables ***
${START_URL} =  http://192.168.0.14:39020/ilp/
${SEARCH_TERM} =  eventcourse
${USER_NAME} =  eventtester
${PASSWORD} =  eventtester

*** Keywords ***
Open ILP
    Go To  ${START_URL}
    Sleep  15s
    Page should contain element  id=externalForm:login


Log in to ILP
    Go To  ${START_URL}
    Sleep  10s
    Input Text  id=externalForm:login  ${USER_NAME}
    Input Text  id=externalForm:password  ${PASSWORD}
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=NL_PERSONAL_DASHBOARD

Log out from ILP
    Page should contain element  id=NL_PERSONAL_DASHBOARD
    Click element  xpath=//a[@id='NL_USERMENU']/span[3]
    Sleep  5s
    Click element  id=NL_LOGOUT
    Sleep  10s

Open all catalogues
    page should contain element  id=NL_TERMSOFSERVICE
    click element  id=NL_CATALOGUE_DROPDOWN
    Sleep  5s
    click element  id=NL_CATALOG_SEARCH_0
    Sleep  10s
    Page should contain element  id=searchField

Set language to ENGB
    page should contain element  id=NL_TERMSOFSERVICE
    click element  xpath=//ul[@id='lang-selection']/li[3]/a
    Sleep  10s
