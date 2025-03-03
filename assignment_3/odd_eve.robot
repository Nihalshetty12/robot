*** Settings ***
Library    Collections

*** Variables ***
@{Words}    Rainbow  computer  science   programming   python   mathematics  player  condition   reverse    water   board   geeks
@{odd_words}
@{even_words}
*** Test Cases ***
List creation
    log    ${Words}
Length of elements
    FOR     ${items}    IN  @{Words}
    ${len}  get length  ${items}
    ${remainder}    Evaluate   ${len} % 2

    Run Keyword if    ${remainder} == 0     append to list    ${even_words}     ${items}
    Run Keyword if    ${remainder} != 0     append to list    ${odd_words}      ${items}
    END

    ${odd_words}=   sort list    ${odd_words}
    ${even_words}   sort list    ${even_words}
Output List
    log    Original list= ${Words}
    log    Even list= ${even_words}
    log    Odd list= ${odd_words}