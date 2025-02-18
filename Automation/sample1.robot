*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
This is a sample test case to open google search page
    open browser    https://www.google.com/     chrome
    maximize browser window
    input text    name:q    Laptop
    capture page screenshot    page.png

