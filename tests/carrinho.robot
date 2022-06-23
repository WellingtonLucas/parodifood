*** Settings ***

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Adicionar um item ao carrinho

    ${cart_json}    Get JSON    cart.json

    Go To Restaurants
    Choose Restaurant    ${cart_json}

    Add To Cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error
    Total Cart Should Be    15,60

Adicionar três itens ao carrinho

    ${cart_json}    Get JSON    cart.json

    Go To Restaurants
    Choose Restaurant    ${cart_json}

    FOR                   ${product}            IN    @{cart_json["products"]}
    Add To Cart           ${product["name"]}
    Should Add To Cart    ${product["name"]}
    END

    Total Cart Should Be    38,00

