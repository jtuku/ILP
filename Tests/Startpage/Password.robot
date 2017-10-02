*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Password forgotten
    [Tags]  Smoke
    Open ILP
    Input Text  id=externalForm:login   ${USER_NAME}
    Input Text  id=externalForm:password  totallywrong
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=server-error
    Input Text  id=loginform:login  totallywrong
    Input Text  id=loginform:password  ${PASSWORD}
    Sleep  5s
    Click Element  id=loginform:loginButton
    Sleep  20s
    Page should contain element  id=server-error

Request new password
    [Tags]  Smoke
    Open ILP
    Input Text  id=externalForm:login   ${USER_NAME}
    Input Text  id=externalForm:password  totallywrong
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  20s
    Page should contain element  id=server-error
    Click Element  xpath=//form[@id='loginform']/a
    Sleep  10s
    Page should contain element  id=resetform:PasswordRequestLogin
    Click Element  id=resetform:PasswordRequestButton
    Sleep  5s
    Page should contain element  xpath=//form[@id='resetform']/fieldset/label
    Input Text  id=resetform:PasswordRequestLogin  doesnotmattername
    Click Element  id=resetform:PasswordRequestButton
    Sleep  10s
    Page should contain element  xpath=//section[@id='password-request-section']/div/div
