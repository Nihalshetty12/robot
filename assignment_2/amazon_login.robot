*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}          https://www.amazon.in/?&tag=googhydrabk1-21&ref=pd_sl_5szpgfto9i_e&adgrpid=155259813593&hvpone=&hvptwo=&hvadid=674893540034&hvpos=&hvnetw=g&hvrand=17906269698129276827&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9303628&hvtargid=kwd-64107830&hydadcr=14452_2316413&gad_source=1
${BROWSER}      Chrome
${ACCOUNTS}     //span[@id="nav-link-accountList-nav-line-1"]
${SIGN_IN}      //input[@id="nav-flyout-ya-signin"]
${EMAIL_INPUT}  //input[@id="ap_email"]
${EMAIL}        shettynihal2004@gmail.com
${CONTINUE}     //input[@id="continue"]
${PASS_INPUT}   //input[@id="ap_password"]
${PASSWORD}     Nihal@120304
${PASS_ENTER}   //input[@id="signInSubmit"]
*** Test Cases ***
Amazon Sign in
    open browser    ${URL}      ${BROWSER}
    maximize browser window
    click element    ${ACCOUNTS}
    wait until element is visible    ${EMAIL_INPUT}     3s
    click element    ${EMAIL_INPUT}
    input text      ${EMAIL_INPUT}    ${EMAIL}
    wait until element is visible    ${CONTINUE}    10s
    click element    ${CONTINUE}
    wait until element is visible    ${pass_input}  10s
    click element    ${PASS_INPUT}
    input text       ${PASS_INPUT}      ${PASSWORD}
    wait until element is visible    ${PASS_ENTER}      10s
    click element    ${PASS_ENTER}
    sleep    10s
    close browser

