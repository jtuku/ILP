*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Myprofile
    [Tags]  Smoke
    Log in to ILP
    click element  xpath=//a[@id='NL_USERMENU']/span[3]
    click element  xpath=//a[@id='NL_PROFILE']/span
    sleep  7s
    page should contain element  xpath=//div[@id='userprofile']/div/div[1]/section[1]/div/div/div/div[1]
    page should contain  Person

Manage account
    [Tags]  Smoke
    Log in to ILP
    click element  xpath=//a[@id='NL_USERMENU']/span[3]
    click element  xpath=//a[@id='NL_EDITACCOUNT']/span
    sleep  7s
    page should contain element  xpath=//div[@id='userprofile']/div/div[1]/manageaccount-header/section/div[1]/div/div/div[1]/userprofile-fileupload
    page should contain  Person
    input text  id=LASTNAME  editedlastname
    input text  id=TITLE  doctor
    click element  id=saveProfileButton
    sleep  5s
    click element  xpath=//a[@id='NL_USERMENU']/span[3]
    click element  xpath=//a[@id='NL_PROFILE']/span
    sleep  7s
    page should contain  doctor
    page should contain  editedlastname

