//
//  LoginViewControllerUITests.swift
//  Fruit MVVMUITests
//
//  Created by Hamzah Azam on 18/04/2023.
//

import XCTest

final class LoginViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFruitLabelExists() throws{
        let fruitLabel = app.staticTexts["Fruit"]
        XCTAssertTrue(fruitLabel.exists)
    }
    
    func testTextFieldsExists() throws{
        let emailIDTextField = app.textFields["Email ID"]
        emailIDTextField.tap()
        emailIDTextField.typeText("abc@abc.com")
        XCTAssertTrue(emailIDTextField.exists)
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("1234567")
        XCTAssertTrue(passwordTextField.exists)
    }
    
    
    func testButtonsExists(){
        let signInButton = app.buttons["Sign in"]
        signInButton.tap()
        XCTAssertTrue(signInButton.exists)
        
        let cancelScroll = app/*@START_MENU_TOKEN@*/.otherElements["oops"].scrollViews/*[[".otherElements[\"oops\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.otherElements
        cancelScroll.buttons["Cancel"].tap()
//        XCTAssertTrue(cancelScroll.exists)

        let detailsButton = app.buttons["details"]
        XCTAssertTrue(detailsButton.exists)
        detailsButton.tap()
        
        let backButton = app.buttons["Back"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()

        
        let secondStoryboardButton = app.buttons["Second storyboard"]
        XCTAssertTrue(secondStoryboardButton.exists)
        secondStoryboardButton.tap()

    
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Home"].tap()
        XCTAssertTrue(tabBar.exists)

        
        let galleryButton = tabBar.buttons["Gallery"]
        galleryButton.tap()
        XCTAssertTrue(galleryButton.exists)

        let settingsButton = tabBar.buttons["Settings"]
        settingsButton.tap()
        XCTAssertTrue(settingsButton.exists)

    }
    
    
    func testSomeflow(){
        
        let app = XCUIApplication()
        let emailIdTextField = app.textFields["Email ID"]
        emailIdTextField.tap()
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        
        let signInButton = app.buttons["Sign in"]
        signInButton.tap()
        
        let elementsQuery = app/*@START_MENU_TOKEN@*/.otherElements["oops"].scrollViews/*[[".otherElements[\"oops\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.otherElements
        elementsQuery.buttons["Cancel"].tap()
        signInButton.tap()
        elementsQuery.buttons["Login"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["details"].staticTexts["details"]/*[[".buttons[\"details\"].staticTexts[\"details\"]",".staticTexts[\"details\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Persimmon"]/*[[".cells.staticTexts[\"Persimmon\"]",".staticTexts[\"Persimmon\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Gooseberry"]/*[[".cells.staticTexts[\"Gooseberry\"]",".staticTexts[\"Gooseberry\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Cranberry"]/*[[".cells.staticTexts[\"Cranberry\"]",".staticTexts[\"Cranberry\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let backButton = app.navigationBars["Fruit_MVVM.TableView"].buttons["Back"]
        backButton.tap()
        
        app.buttons["Second storyboard"].staticTexts["Second storyboard"].tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Home"].tap()
        
        let galleryButton = tabBar.buttons["Gallery"]
        galleryButton.tap()
        
        tabBar.buttons["Settings"].tap()
        app.navigationBars["Fruit_MVVM.SBView"].buttons["Back"].tap()

        
    }
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
