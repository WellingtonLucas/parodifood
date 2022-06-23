*** Settings ***

Documentation    Base file from project

Library    Browser            strict=False
Library    OperatingSystem

Resource    actions/search.robot
Resource    actions/cart.robot

*** Keywords ***
Start Session
    New Browser    chromium                              False
    New Page       http://parodifood.qaninja.academy/
    Get Text       span                                  contains    Nunca foi tão engraçado pedir comida

### Helpers ###
Get JSON

    [Arguments]    ${file_name}

    ${file}         Get File    ${EXECDIR}/resources/fixtures/${file_name}
    ${super_var}    Evaluate    json.loads($file)                             json

    [return]    ${super_var}

