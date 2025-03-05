*** Settings ***
Library    Collections
*** Variables ***
@{Words}    Dog    cat    23    bat    7.45     helicopter  robot   127802    crocodile   panda
*** Keywords ***
Creating a list
    log    Original list: ${Words}
Swap 3rd element
    ${temp}=    get from list    ${Words}   2
    ${temp_1}=  get from list    ${Words}   5
    set list value    ${Words}  2   ${temp_1}
    set list value    ${Words}  5   ${temp}
    log   Swapped list: ${Words}
*** Test Cases ***
Swapping
    Creating a list
    Swap 3rd element