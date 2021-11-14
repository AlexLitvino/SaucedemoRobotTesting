*** Settings ***
Documentation    General variables and keywords
Library    SeleniumLibrary

*** Variables ***
${BASE URL}    https://www.saucedemo.com
${BROWSER}        Chrome
${STANDARD_USER_USERNAME}    standard_user
${STANDARD_USER_PASSWORD}    secret_sauce
${STANDARD_USER_INCORRECT_PASSWORD}    secret_sauce111
${NON_EXISTING_USER}    non_existing_user
${NON_EXISTING_USER_PASSWORD}    secret_sauce
${LOCKED_OUT_USER_USERNAME}    locked_out_user
${LOCKED_OUT_USER_PASSWORD}    secret_sauce


*** Keywords ***
