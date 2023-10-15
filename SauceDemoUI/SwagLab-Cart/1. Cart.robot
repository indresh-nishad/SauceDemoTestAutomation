*** Settings ***
Documentation    This file contains testcase related to Cart
Test Setup       Login To SauceDemo
Test Teardown      Logout from SauceDemo
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource          ../../Lib/Library_SwagLab_Login.robot
Resource          ../../Resources/Resource_Generic_TestProperties.robot
Resource          ../../Resources/SauceDemoUsers.robot
Resource          ../../OR/Login_Object_Repo.robot


Resource          ../../OR/Cart_ObjectRepo.robot
Resource          ../../OR/MainPage_Object_Repo.robot



*** Variables ***
${productName}      Sauce Labs Onesie



*** Test Cases ***
TC_001 Verify add to cart by adding single product to cart

	Select product and click on add to cart      ${productName}
	Go to cart section
	Verify Same product is added to cart

TC_002 Verify add to cart by removing single product from cart
	Select product and click on add to cart      ${productName}
	Go to cart section
	Verify Same product is added to cart
	Remove Product from cart
    Verify product is removed from cart












#logout and login again to see cart










*** Keywords ***


Select product and click on add to cart
	[Arguments]    ${productName}
	Click Element    ${Home_product1}

Go to cart section
	    Click Element    ${Home_CartIcon}



Verify Same product is added to cart

	   @{cartList}      Get Webelements           ${Cart_cartItems}
	   @{cartItemsName}   Create List
	   FOR    ${item}      IN    @{cartList}
	           ${text}      Get Text        ${item}
	           Append To List        ${cartItemsName}      ${text}
	   END
	   List Should Contain Value    ${cartItemsName}     ${productName}

Remove Product from cart
	TRY
	    Click Element    ${Cart_product_remove}
	EXCEPT
		Log     Product not found
	END

Verify product is removed from cart
	@{cartList}      Get Webelements           ${Cart_cartItems}
	   @{cartItemsName}   Create List
	   FOR    ${item}      IN    @{cartList}
	           ${text}      Get Text        ${item}
	           Append To List        ${cartItemsName}      ${text}
	   END
	   List Should Not Contain Value       ${cartItemsName}     ${productName}
