*** Settings ***
Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Buscar um único restaurante
    Go To Restaurants
    Search By                       Debuger King
    Restaurant Should Be Visible    DEBUGER KING
    Restaurant Count Should Be      1

Buscar restaurante por categoria
    Go To Restaurants
    Search By                       Cafe
    Restaurant Should Be Visible    STARBUGS COFFEE
    Restaurant Count Should Be      1

Buscar todos os restaurantes
    Go To Restaurants
    Search By                            a
    All Restaurants Should Be Visible
    Restaurant Count Should Be           5

