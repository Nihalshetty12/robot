*** Settings ***
Library    Collections

*** Variables ***
@{LIST}    Apple    Banana    Mango

*** Test Cases ***
Check Collections Library
    Log    First Item: @{LIST}[0]
    Append To List    ${LIST}    Orange
    Log    Updated List: ${LIST}
