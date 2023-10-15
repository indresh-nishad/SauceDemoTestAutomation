

*** Settings ***
Library    SeleniumLibrary

Library    OperatingSystem
Library    Collections

Resource     ../../Lib/Library_SwagLab_Login.robot
Resource     ../../Resources/Resource_Generic_TestProperties.robot
Resource      ../../Resources/SauceDemoUsers.robot
Resource     ../../Login_Object_Repo.robot


*** Test Cases ***