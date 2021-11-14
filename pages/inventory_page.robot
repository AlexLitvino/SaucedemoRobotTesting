*** Settings ***
Documentation    Set of variables and keywords for Login page
Library    SeleniumLibrary
Resource    ../resource.robot


*** Variables ***
${Inventory Container}    id:inventory_container


*** Keywords ***
Inventory Page Is Displayed
    Element Should Be Visible    ${Inventory Container}
