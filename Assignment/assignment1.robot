*** Settings ***
Library    Collections
Library    remove_last.py
*** Variables ***
@{NUMBERS}
&{ALPHA_NUM}
*** Keywords ***
Append To My List
    FOR    ${i}     IN RANGE    1   11
        append to list      ${NUMBERS}   ${i}
    END

Append To My Dict
    ${keys}     Create List     a   b   c   d   e   f   g   h   i   j
    ${values}     Create list     1   2   3   4   5   6   7   8   9   10
    ${ALPHA_DICT}   Create Dictionary
    FOR     ${index}    IN RANGE   10
        set to dictionary    ${ALPHA_NUM}   ${keys}[${index}]   ${values}[${index}]
    END

Remove Last Element from List
    ${NUMBERS}  remove_last.delete last element    ${NUMBERS}
    Log     Updated List: ${NUMBERS}

Remove Last Element from Dict
    ${ALPHA_NUM}    remove_last.delete last element    ${ALPHA_NUM}
    Log     Updated Dict: ${ALPHA_NUM}

*** Test Cases ***
Test List and Dict Operations
    Append To My List
    Append To My Dict
    Log     Initial List: ${NUMBERS}
    log     Initial Dictionary: ${ALPHA_NUM}

    Remove Last Element from List
    Remove Last Element from Dict


