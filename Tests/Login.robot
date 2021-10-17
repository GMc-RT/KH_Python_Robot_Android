*** Settings ***
Library                         AppiumLibrary
Resource                        ../Resources/android-res.robot

*** Test Cases ***
Check_login_is_accessable_from_splash
    [Tags]                          Functional      Fast    SmokeTest
    [Documentation]                 When the login Button is clicked dispose of the splash screen and show the login screen
    Open Kaia App
    Dispose Of Splash Screen

Login_with_incorrect_details
    [Documentation]                 When the incorrect login details are used, show a warning, and do not progress into the app
    [Tags]                          Functional      Fast    SmokeTest
    Open Kaia App
    Dispose Of Splash Screen
    Signin With User                ${USER-LOGIN-INCORRECT}[email]           ${USER-LOGIN-INCORRECT}[password]
    check that an error is shown

Login_with_correct_details
    [Documentation]                 When the user logs on with the correct details, they should see the Unlock page
    [Tags]                          Functional      Fast    SmokeTest
    Open Kaia App
    Dispose Of Splash Screen
    Signin With User                ${USER-LOGIN-CORRECT}[email]           ${USER-LOGIN-CORRECT}[password]
    check that the user is logged in



# Run the tests with: robot -d Output Tests/Login.robot