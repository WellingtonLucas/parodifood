*** Settings ***

Library    Browser    strict=False

Documentation    This is a resource file, that can contain variables and keywords.
...              Keywords defined here can be used where this search.robot in loaded.

*** Variables ***
${DIV_BOX_RESTAURANT}    css=div[class="place-info-box"][style="opacity: 1;"]    

*** Keywords ***

Go To Restaurants
    Click       text=Estou com fome!
    Get Text    h1                      contains    Ta na hora de matar a fome!

Choose Restaurant
    [Arguments]    ${super_var}

    Click    text=${super_var["restaurant"]}

    Wait For Elements State    css=#detail    visible     10
    Get Text                   css=#detail    contains    ${super_var["desc"]}

Search By
    [Arguments]    ${value}
    Click          css=.search-link
    Fill Text      css=input[formcontrolname="searchControl"]    ${value}

Restaurant Should Be Visible
    [Arguments]                ${value}
    Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible     timeout=10s
    Get Text                   ${DIV_BOX_RESTAURANT}    contains    ${value}

Restaurant Count Should Be
    [Arguments]          ${qtd}
    Get Element Count    ${DIV_BOX_RESTAURANT}    equal    ${qtd}

All Restaurants Should Be Visible
    Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible    timeout=10s