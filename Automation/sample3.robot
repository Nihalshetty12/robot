*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
@{FRUITS}   Apple   Banana  Mango
&{USER}     name=Alice  age=25  city=Mumbai

*** Test Cases ***
Using List
        Log     First Fruit: @{FRUITS}
        Append To List    ${FRUITS}     Orange
        Log     Updated List: ${FRUITS}

Using Dictionary
        Log     User Name: &{USER}[name]
        set to dictionary    &{USER}    email=nihal1234@gmail.com
        Log     updated user info: &{USER}