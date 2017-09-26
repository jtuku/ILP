*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER} =  ie

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
End Web Test
    Close All Browsers