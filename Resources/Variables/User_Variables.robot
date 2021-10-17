*** Settings ***
Resource                        password.robot

*** Variables ***

#*** Test Variables ***
&{USER-LOGIN-INCORRECT}         email=erzsebet.nyiri+casestudy101@kaiahealth.com    password=${PASSWORD}
&{USER-LOGIN-CORRECT}           email=erzsebet.nyiri+casestudy1@kaiahealth.com      password=${PASSWORD}