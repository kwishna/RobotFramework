*** Settings ***
Library    SeleniumLibrary    

Documentation    Here We Will Try To Login In a Website


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
Sample Login Test
    [Documentation]    Test Case For Logins
     
    Open Browser                 ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    # Using The Custom Keyword
    Submit Login Details
    Click Element                id=welcome
    Click Element                xpath://a[text()='Logout']
    Log                          User Was Logged In As Username &{LoginData}[username] and Password &{LoginData}[password]
    Close Browser