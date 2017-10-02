*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER} =  ie

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
End Web Test
    Close All Browsers
Logout and end web test
    Page should contain element  id=NL_PERSONAL_DASHBOARD
    Click element  xpath=//a[@id='NL_USERMENU']/span[3]
    Sleep  5s
    Click element  id=NL_LOGOUT
    Sleep  10s
    Close All Browsers