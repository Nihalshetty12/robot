*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}           https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.5
${USERNAME}      test_user
${PASSWORD}      test_pass
${LOGIN_BUTTON}  xpath=//button[@id='login']
${USERNAME_FIELD}  xpath=//input[@id='username']
${PASSWORD_FIELD}  xpath=//input[@id='password']
${SUCCESS_MSG}   xpath=//div[@class='success']

*** Test Cases ***
User Login Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${SUCCESS_MSG}    timeout=5s
    Log    Login successful!
    Capture Page Screenshot
    Close Browser