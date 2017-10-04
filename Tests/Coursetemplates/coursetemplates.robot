*** Settings ***
Library  Selenium2Library
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ILP.robot
Test Setup  Begin Web Test
Test Teardown  Logout and end web test

*** Test Cases ***
Template with available courses
    [Tags]  Smoke
    Log in to ILP
    Set language to ENGB
    Go to  ${START_URL}pages/coursedescription.jsf?courseId=555083&catalogId=219815
    sleep  7s
    page should contain element  id=course-prebook-button
    page should contain  Course1BasedOnPrebookingTemplate
    page should contain  Unlimited
    click element  id=course-prebook-button
    sleep  5s
    page should contain element  id=prebook_dialog
    click element  id=prebook_dialog-form:prebook_dialog-abortBtn
    sleep  5s
    click element  id=course-prebook-button
    sleep  5s
    page should contain element  id=prebook_dialog
    click element  id=prebook_dialog-form:prebook_dialog-actionBtn
    sleep  9s
    page should contain element  id=course-remove-prebook-button
    Go to  ${START_URL}pages/personalarea.jsf#!/mylearnings/pending
    sleep  9s
    page should contain  PrebookingTemplate
    go back
    sleep  7s
    click element  id=course-remove-prebook-button
    page should contain  Remove
    click element  id=prebook_removal_dialog-form:prebook_removal_dialog-abortBtn
    sleep  5s
    click element  id=course-remove-prebook-button
    page should contain  Remove
    click element  id=prebook_removal_dialog-form:prebook_removal_dialog-actionBtn
    sleep  9s
    page should contain element  id=course-prebook-button
    Go to  ${START_URL}pages/personalarea.jsf#!/mylearnings/pending
    sleep  9s
    page should not contain  PrebookingTemplate

Template with enrolment form
    [Tags]  Smoke
    Log in to ILP
    Set language to ENGB
    Go to  ${START_URL}pages/coursedescription.jsf?catalogId=115293&courseId=690116
    sleep  7s
    page should contain element  id=course-prebook-button
    click element  id=course-prebook-button
    sleep  5s
    page should contain element  xpath=//div[@id='enrolmentform']/div[1]/ng-view/section/div/enrolmentform-trainingdata/div/div[1]
    click element  xpath=//div[@id='preferredStartDate']/span
    sleep  4s
    page should contain  Su
    input text  id=comments  testcomment
    sleep  4s
    click element  id=saveRegFormButton
    sleep  5s
    page should contain  Preferred
    page should contain element  id=course-remove-prebook-button
    Go to  ${START_URL}pages/personalarea.jsf#!/mylearnings/pending
    sleep  8s
    page should contain  PreBooking Reg Template 2
    click element  xpath=//one-column-list-item[@id='one-column-list-layout-item-690116']/div/div/div/div[3]/button
    sleep  4s
    click element  id=courseInfoButton_690116_removePrebookingForCourse
    sleep  3s
    click element  id=mycourses_remove_prebooking_reveal_action_form_proceed_button
    sleep  8s
    page should not contain  PreBooking Reg Template 2
    Go to  ${START_URL}pages/coursedescription.jsf?catalogId=115293&courseId=690116
    sleep  7s
    page should contain element  id=course-prebook-button








