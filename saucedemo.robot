*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser


*** Variables ***
${URL}            https://www.saucedemo.com/
${VALID_USER}     standard_user
${INVALID_USER}   invalid_user
${INVALID_PASS}   invalid_pass

*** Test Cases ***
# Positive Scenario: Successfully purchase product
Successful Purchase Flow
    [Tags]    Positive
    ${random_pass}=    Generate Random Password
    Login With Credentials    ${VALID_USER}    secret_sauce
    Add Product To Cart
    Proceed To Checkout
    Assert Successful Purchase

# Negative Scenario: Invalid login should fail
Invalid Login Attempt
    [Tags]    Negative
    ${random_pass}=    Generate Random Password
    Go To Login Page
    Login With Credentials    ${INVALID_USER}    ${random_pass}
    Assert Invalid Login Error

*** Keywords ***
Generate Random Password
    ${password}=    Generate Random String    8    [LETTERS][NUMBERS]
    [Return]    ${password}

Go To Login Page
    Go To    ${URL}
    Wait Until Page Contains Element    id=user-name    timeout=20s

Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${URL}
    Wait Until Page Contains Element    id=user-name    timeout=20s

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password     ${password}
    Click Button  id=login-button

Add Product To Cart
    Click Element    xpath=//div[text()='Sauce Labs Backpack']
    Click Button     xpath=//button[text()='Add to cart']
    Click Element    id=shopping_cart_container

Proceed To Checkout
    Wait Until Element Is Visible    id=checkout     timeout=20s
    Click Button    id=checkout
    Input Text      id=first-name    John
    Input Text      id=last-name     Doe
    Input Text      id=postal-code   12345
    Click Button    id=continue
    Click Button    id=finish

Assert Successful Purchase
    Page Should Contain    Thank you for your order!

Assert Invalid Login Error
    Wait Until Element Is Visible    xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
    Page Should Contain Element    xpath=//*[@id="login_button_container"]/div/form/div[3]/h3

