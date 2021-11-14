*** Settings ***
Documentation     Testing of Login page layout and behavior

Library    SeleniumLibrary
Resource    ../pages/login_page.robot
Resource    ../pages/inventory_page.robot
Variables    ../string_resources.py

Test Teardown    Close Browser


*** Variables ***


*** Keywords ***
Login with erroneous data

    [Arguments]    ${username}    ${password}    ${expected error message text}
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${username}    ${password}
    Login Error Should Be Displayed    ${expected error message text}
    Click Close Error Button
    Login Error Should Not Be Displayed
    Close Browser


*** Test Cases ***
Login page is visible
    Navigate to Login page
    Login Page Should Be Displyed


Successfull Login
    Navigate to Login page
    Fill in Login Form And Click Login for    ${STANDARD_USER_USERNAME}    ${STANDARD_USER_PASSWORD}
    Inventory Page Is Displayed


Login Page Text
    Navigate to Login page
    Element Attribute Value Should Be    ${Username Input Field}    placeholder    ${USERNAME_FIELD_PLACEHOLDER}
    Element Attribute Value Should Be    ${Password Input Field}    placeholder    ${PASSWORD_FIELD_PLACEHOLDER}
    # Expected fail due to CSS property
    Element Attribute Value Should Be    ${Login Button}    value    ${LOGIN_BUTTON_TEXT}


Login With Incorrect Password
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${STANDARD_USER_USERNAME}    ${STANDARD_USER_INCORRECT_PASSWORD}
    Login Error Should Be Displayed    ${NON_EXISTING_USER_ERROR_TEXT}
    Click Close Error Button
    Login Error Should Not Be Displayed


Login as non-existing user
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${NON_EXISTING_USER}    ${NON_EXISTING_USER_PASSWORD}
    Login Error Should Be Displayed    ${NON_EXISTING_USER_ERROR_TEXT}
    Click Close Error Button
    Login Error Should Not Be Displayed


Login as locked-out user
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${LOCKED_OUT_USER_USERNAME}    ${LOCKED_OUT_USER_PASSWORD}
    Login Error Should Be Displayed    ${LOCKED_OUT_USER_ERROR_TEXT}
    Click Close Error Button
    Login Error Should Not Be Displayed


Login without username
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${EMPTY}    ${STANDARD_USER_PASSWORD}
    Login Error Should Be Displayed    ${MISSING_USERNAME_ERROR_TEXT}
    Click Close Error Button
    Login Error Should Not Be Displayed


Login withoiut password
    Navigate to Login Page
    Fill in Login Form And Click Login for    ${STANDARD_USER_USERNAME}    ${EMPTY}
    Login Error Should Be Displayed    ${MISSING_PASSWORD_ERROR_TEXT}
    Click Close Error Button
    Login Error Should Not Be Displayed


# Example of previous five tests combined into one data-driven test
Login as user with erroneous data
    [Template]    Login with erroneous data
    ${STANDARD_USER_USERNAME}    ${STANDARD_USER_INCORRECT_PASSWORD}    ${NON_EXISTING_USER_ERROR_TEXT}
    ${NON_EXISTING_USER}    ${NON_EXISTING_USER_PASSWORD}    ${NON_EXISTING_USER_ERROR_TEXT}
    ${LOCKED_OUT_USER_USERNAME}    ${LOCKED_OUT_USER_PASSWORD}    ${LOCKED_OUT_USER_ERROR_TEXT}
    ${EMPTY}    ${STANDARD_USER_PASSWORD}    ${MISSING_USERNAME_ERROR_TEXT}
    ${STANDARD_USER_USERNAME}    ${EMPTY}    ${MISSING_PASSWORD_ERROR_TEXT}
