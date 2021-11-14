*** Settings ***
Documentation    Set of variables and keywords for Login page
Library    SeleniumLibrary
Resource    ../resource.robot


*** Variables ***
# Locators
${Login Logo}    class:login_logo
${Username Input Field}    id:user-name
${Password Input Field}    id:password
${Login Button}    id:login-button
${Username Error Indicator}    xpath://input[@id="user-name"]/following-sibling::*[name()="svg"]
${Password Error Indicator}    xpath://input[@id="password"]/following-sibling::*[name()="svg"]
${Error Message}    xpath://div[@class="error-message-container error"]/h3
${Close Error Button}    class:error-button


*** Keywords ***
Navigate to Login page
    Open Browser    ${BASE URL}    ${BROWSER}

Input Username
    [Arguments]    ${username}
    Input Text    ${Username Input Field}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${Password Input Field}    ${password}

Click Login Button
    Click Button    ${Login Button}

Fill in Login Form And Click Login for
    [Arguments]    ${username}   ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

Login Page Should Be Displyed
    Element Should Be Visible    ${Login Logo}
    Element Should Be Visible    ${Username Input Field}
    Element Should Be Visible    ${Password Input Field}
    Element Should Be Visible    ${Login Button}

Login Error Should Be Displayed
    [Arguments]    ${error message_text}
    Element Should Be Visible    ${Username Error Indicator}
    Element Should Be Visible    ${Password Error Indicator}
    Element Should Be Visible    ${Error Message}
    Element Should Be Visible    ${Close Error Button}
    Element Text Should Be    ${Error Message}    ${error message_text}

Click Close Error Button
    Click Button    ${Close Error Button}

Login Error Should Not Be Displayed
    Element Should Not Be Visible    ${Username Error Indicator}
    Element Should Not Be Visible    ${Password Error Indicator}
    Element Should Not Be Visible    ${Error Message}
    Element Should Not Be Visible    ${Close Error Button}
