*** Settings ***
Documentation    Actionf from carrinho.robot

*** Keywords ***

Add To Cart
    [Arguments]    ${name}

    Click    xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]    ${name}

    Wait For Elements State    css=#cart tr >> text=${name}    visible    5

Total Cart Should Be
    [Arguments]    ${total}

    Get Text    xpath=//th[contains(text(),"Total")]/..//td    contains    ${total}