*** Settings ***
Library                         AppiumLibrary
Resource                        ../Page_Objects/Splash_Page.robot
Resource                        ../Page_Objects/Login_Page.robot
Resource                        ../Page_Objects/Unlock_Page.robot
Resource                        ../Keywords/Login_Keywords.robot
Resource                        ../Variables/Application_Variables.robot
Resource                        ../Variables/User_Variables.robot


*** Keywords ***

Open Kaia App
    Open Application  http://localhost:4723/wd/hub      platformName=${KAIA-PLATFORM-NAME}  deviceName=${KAIA-EMULATOR-ID}    appPackage=${Kaia-APPLICATION-ID}   appActivity=${KAIA-APPLICATION-ACTIVITY}   automationName=${KAIA-AUTOMATION-NAME}

Dispose Of Splash Screen
    Wait Until Page Contains Element    ${SPLASH-LOGO-IMAGE}
    Wait Until Page Contains Element    ${SPLASH-TOP-LABEL}
    Wait Until Page Contains Element    ${SPLASH-SIGN-UP-BUTTON}
    Wait Until Page Contains Element    ${SPLASH-SIGN-IN-BUTTON}
    Click Element                       ${SPLASH-SIGN-IN-BUTTON}
    Wait Until Page Contains Element    ${LOGIN-EMAIL-FIELD}
    Wait Until Page Contains Element    ${LOGIN-PASSWORD-FIELD}
    Wait Until Page Contains Element    ${LOGIN-FORGOT-PASSWORD-LINK}
    Wait Until Page Contains Element    ${LOGIN-LOG-IN-EMAIL-BUTTON}
    Wait Until Page Contains Element    ${LOGIN-LOG-IN-PULSE-BUTTON}

Input User Email
    [Arguments]    ${USEREMAIL}
    Click Element                       ${LOGIN-EMAIL-FIELD}
    Wait Until Page Contains Element    ${LOGIN-EMAIL-EDIT-TEXT}
    Input Text                          ${LOGIN-EMAIL-EDIT-TEXT}            ${USEREMAIL}

Input User Password
    [Arguments]     ${USERPASSWORD}
    Click Element                       ${LOGIN-PASSWORD-FIELD}
    Input Password                      ${LOGIN-PASSWORD-EDIT-TEXT}         ${USERPASSWORD}
    Click Element                       ${LOGIN-LOG-IN-EMAIL-BUTTON}

Signin With User
    [Arguments]    ${USEREMAIL}     ${USERPASSWORD}
    Input User Email                    ${USEREMAIL}
    Input User Password                 ${USERPASSWORD}

Check That An Error Is Shown
    Wait Until Page Contains Element    ${LOGIN-ERROR-LABEL}

Check That The User Is Logged In
    Wait Until Page Contains Element    ${UNLOCK-UNLOCK-BUTTON}