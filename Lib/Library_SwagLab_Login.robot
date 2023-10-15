*** Settings ***
Documentation    Library File
...             contain all  generic keywords
Library         SeleniumLibrary
Library          Collections
Resource         ../Resources/Resource_Generic_TestProperties.robot
Resource         ../Resources/SauceDemoUsers.robot
Resource         ../OR/Login_Object_Repo.robot

Resource          ../OR/Cart_ObjectRepo.robot
Resource          ../OR/MainPage_Object_Repo.robot


*** Variables ***
${zoomLevel}     100



*** Keywords ***
Login to SauceDemo
	Login with User

Logout from SauceDemo
	Logout and close browser

Login with User
	Open Swaglabs
	Login

Open Swaglabs
	[Documentation]    Opens swaglabs in a browser
	Launch Browser
	Set Selenium Speed      ${SeleniumSpeed}
	Maximize Browser Window
	Sleep    5s
Launch Browser
	   Run Keyword If   '${target_browser}'=='Chrome'   Create Webdriver     ${target_browser}

	   Run Keyword If        '${target_browser}'=='Edge'   Create Webdriver     ${target_browser}
	   Execute Javascript      document.body.style.zoom='100%'
       Run Keyword If    '${target_browser}'!='Parallel'     Go To       ${QA-CORE_URL}

Login
	 [Documentation]    keyword for performing login to Swag labs
	#BuiltIn.Set Log Level      None

	Input Username for Login
	Input Password for Login
	Submit Credentials
	Page Should Contain        Swag Labs
	sleep    10s


	#Builtin.Set Log Level      INFO


Input Username for Login
	input text      ${login_userName}          ${User1}



Input Password for Login
	input text       ${login_password}         ${password}

Submit Credentials
	Click element       ${login_loginButton}


Logout and close browser
	    Click Element       ${Home_OpenMenu}
	    Mouse Over          ${Home_LogOut}
	    Run Keyword And Ignore Error    Click Element        ${Home_LogOut}






