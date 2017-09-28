*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Check external dashboard
    [Tags]  Smoke
    Open ILP
    Page should contain element  xpath=//div[@id='dashboards-section']/div[4]/dashboard-catalogue-panel/section/div[3]
    Page should contain element  id=scroll-top-link-in-about-ocw-section
    Page should contain element  xpath=//ul[@id='lang-selection']/li[3]
    Click element  xpath=//ul[@id='lang-selection']/li[1]
    Sleep  5s
    Page should contain  Anmelden
    Click Element  id=link-frontpage
    Sleep  10s
    page should contain element  id=NL_TERMSOFSERVICE
    click element  id=NL_CATALOGUE_DROPDOWN
    Sleep  5s
    click element  id=NL_CATALOG_SEARCH_0
    Sleep  5s
    Page should contain element  id=searchField

Check external dashboard panel
    Open ILP
    Page should contain element  xpath=//div[@id='dashboards-section']/div[4]/dashboard-catalogue-panel/section/div[3]
    Page should contain element  xpath=//li[@id='603896']/a/div[2]/div/div[3]/div[1]
    Page should contain element  xpath=//li[@id='603896']/a/div[2]/div/div[3]/div[2]
    Page should contain element  xpath=//li[@id='603896']/a/div[1]/div/img
    Click element  xpath=//li[@id='603896']/a/div[1]
    Sleep  7s
    Page should contain element  id=course-register-button
