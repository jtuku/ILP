*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Sign up user
    [Tags]  Special
    Open ILP
    Click Element  id=NL_SIGNUP
    Sleep  10s
    Page should contain element  id=signUpform:signupbutton
    Click Element  id=signUpform:signupbutton
    Sleep  5s
    Page should contain element  id=server-error
    Input Text  id=signUpform:FIRSTNAME  newuser@newuser.de
    Input Text  id=signUpform:LASTNAME  newuser@newuser.de
    Input Text  id=signUpform:EMAIL  newuser@newuser.de
    Input Text  id=signUpform:PASSWORD  newuser@newuser.de
    Input Text  id=signUpform:PASSWORD_CONFIRMATION  newuser@newuser.de
    Click Element  id=signUpform:acceptTerms
    Click Element  id=signUpform:signupbutton
    Sleep  20s
    Log out from ILP

Login with IDP
    [Tags]  Special
    Open ILP
    Input Text  id=externalForm:login   ${USER_NAME}
    Input Text  id=externalForm:password  totallywrong
    Sleep  5s
    Click Element  id=externalForm:loginButton
    Sleep  10s
    Click Element  id=saml-login-form:samlLoginButton
    Sleep  20s
    Page should contain element  id=loginButton
    Click Element  id=loginButton
    Sleep  5s
    Page should contain element  xpath=//td[@id='identificationLoginErrorCell']/table/tbody/tr/td
    Input Text  id=loginBoxInputfieldTagUsername  ${USER_NAME}
    Input Text  id=loginBoxInputfieldTagPassword  ${PASSWORD}
    Click Element  id=loginButton
    Sleep  20s
    Log out from ILP