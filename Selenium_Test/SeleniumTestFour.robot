*** Settings ***
Library    SeleniumLibrary    

Documentation    Here We Will Try To Login In a Website

Test Setup    Log  Starting The Test Case
Test Teardown    Log  Completing The Test Case
Suite Setup    Log  Running The Test Suite
Suite Teardown    Log  Completing The Test Suite
Test Timeout    50000
Default Tags    Normal

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/
${BROWSER}      Chrome
@{Credentials}	Admin	     admin123
&{LoginData}		username=Admin 	password=admin123

*** Keywords ***
Submit Login Details
    Clear Element Text    id=txtUsername
    Input Text            id=txtUsername    @{Credentials}[0]
    Clear Element Text    txtPassword
    Input Password        id=txtPassword    @{Credentials}[1]
    Click Button          id=btnLogin
    
*** Test Cases ***
MyFirstTestCase
    [Tags]    Sanity
    Log  This Is My First Test Case  level=INFO
    
My Second Test Case
    [Tags]    Sanity  Smoke
    Log  This Is My Second Test Case Which Is First Selenium Test Case.
    Open Browser     ${URL}   browser=${BROWSER}
    Set Browser Implicit Wait   10
    Maximize Browser Window
    Go To    http://google.co.in
    Input Text       name=q               Krishna Poultry Agency
    Sleep            2
    # Press Keys    name=q    ENTER
    Click Button     xpath://div[@class='FPdoLc VlcLAe']//input[@name='btnK']
    Click Element    xpath://a[contains(text(),'THANKS')]
    Close Browser
    
Third Test Login Test
    [Documentation]    Test Case For Logins
    [Tags]    Sanity   Smoke  Regression
    Open Browser                 ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    # Using The Custom Keyword
    Submit Login Details
    Click Element                id=welcome
    Click Element                xpath://a[text()='Logout']
    Log                          User Was Logged In As Username &{LoginData}[username] and Password &{LoginData}[password]
    Close Browser
    
Fourth Test
    Open Browser                 ${URL}    ${BROWSER}
    Maximize Browser Window
    Close Browser
    Set Tags     Regression2    Regression3
    Remove Tags    Regression3