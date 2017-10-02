*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Enrol to course
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    input text  id=searchField  selenium_course1
    Sleep  5s
    page should contain  selenium_course1
    click element  xpath=//one-column-list-item[@id='one-column-list-layout-item-cs_result_item_489035']/div/div/div/div[1]
    Sleep  5s
    page should contain element  id=skills_709032
    page should contain element  id=course-register-button
    page should contain element  id=course-book-staff-button
    click element  id=course-register-button
    sleep  7s
    click element  id=enrolment_dialog_sf-form:enrolment_dialog_sf-actionBtn
    sleep  10s
    page should contain  complete course

Enrol to programme
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    input text  id=searchField  testlink_de_programme_001
    Sleep  5s
    page should contain  testlink_de_programme_001
    click element  xpath=//one-column-list-item[@id='one-column-list-layout-item-cs_result_item_455369']/div/div/div/div[1]
    Sleep  5s
    page should contain  skills
    click element  xpath=//div[@id='course-description-main']/div[2]/a
    sleep  7s
    page should contain  open details
    page should contain element  xpath=//one-column-list-item[@id='one-column-list-layout-item-187391']/div/div/div/div[1]

Open WBT
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    Go to  ${START_URL}pages/mediacontent.jsf?catalogId=643554&mediaId=709169
    Sleep  5s
    page should contain  Open training
    click element  xpath=//section[@id='media-top']/div/div/a/span[1]
    sleep  20s
    click element  id=hideTopbar
    sleep  4s
    page should contain  Home
    click element  xpath=//a[@id='titleWBTBackLinkEnabled']/span[2]
    sleep  9s

Open Link
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    Go to  ${START_URL}pages/mediacontent.jsf?catalogId=219830&mediaId=427875
    Sleep  5s
    page should contain element  xpath=//section[@id='media-top']/div/div/div[2]/img

Open Multimedia
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    Go to  ${START_URL}pages/mediacontent.jsf?catalogId=614551&mediaId=629335
    Sleep  15s
    page should contain element  id=video-player
    click element  id=video-player

Open Event
    [Tags]  Smoke
    Log in to ILP
    Open all catalogues
    Set language to ENGB
    Sleep  7s
    Go to  ${START_URL}pages/mediacontent.jsf?catalogId=490912&mediaId=645088
    Sleep  15s
    page should contain  event
    page should contain  location
    click element  xpath=//div[@id='openLocationDetailsLink']/a[1]
    sleep  6s
    page should contain  Address
    page should contain  Link
    page should contain  Attachment









