*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Search catalogue
    [Tags]  Smoke
    Open ILP
    Open all catalogues
    input text  id=searchField  paypal payment
    Sleep  5s
    page should contain  Paypal payment course

Hiding Filter
    [Tags]  Smoke
    Open ILP
    Open all catalogues
    page should contain element  xpath=//div[@id='filterBtnWrapper']/button[2]
    page should contain  JT skill
    click element  xpath=//div[@id='filterBtnWrapper']/button[2]
    sleep  5s
    page should contain  Show filter
    click element  xpath=//div[@id='filterBtnWrapper']/button[2]
    sleep  5s
    page should contain  JT skill

Quick filters
    [Tags]  Smoke
    Open ILP
    Open all catalogues
    Set language to ENGB
    Sleep  10s
    page should contain  Quick filters
    page should contain  Catalogues
    page should contain  Start date
    page should contain  Content types
    page should contain  Course modes
    page should contain  Enrolment types
    page should contain  Locations
    page should contain  Topics
    page should contain  Reporting
    page should contain  Skills
    click element  xpath=//section[@id='course-section']/display-result/div/div/div/div/div[1]/div/div/advanced-search/facet-main-type/div/div/div[2]/a/div[3]
    Sleep  7s
    page should contain element  xpath=//div[@id='filterSummary']/div/ul/li[2]/div
    reload page
    sleep  7s
    page should contain element  xpath=//div[@id='filterSummary']/div/ul/li[2]/div

Clearing filters
    [Tags]  Smoke
    Open ILP
    Open all catalogues
    Set language to ENGB
    Sleep  10s
    click element  xpath=//section[@id='course-section']/display-result/div/div/div/div/div[1]/div/div/advanced-search/facet-main-type/div/div/div[2]/a/div[3]
    Sleep  7s
    click element  xpath=//div[@id='filterSummary']/div/ul/li[3]/a
    Sleep  9s
    click element  id=loadNextBtn
    page should contain  Show all

Skill details
    [Tags]  Smoke
    Open ILP
    Open all catalogues
    Set language to ENGB
    Sleep  8s
    input text  id=searchField  Enrolment forms course
    Sleep  5s
    page should contain  Enrolment forms course
    page should contain  Improves skill
    click element  xpath=//one-column-list-item[@id='one-column-list-layout-item-cs_result_item_700889']/div/div/div/div[3]/button
    Sleep  5s
    page should contain  JT skill 2 EN GB
    page should contain element  id=skills_709046





