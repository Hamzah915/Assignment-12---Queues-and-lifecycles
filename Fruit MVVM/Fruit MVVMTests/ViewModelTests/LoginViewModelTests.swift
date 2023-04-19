//
//  LoginViewModelTests.swift
//  Fruit MVVMTests
//
//  Created by Hamzah Azam on 13/04/2023.
//

import XCTest
@testable import Fruit_MVVM

final class LoginViewModelTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!

    override func setUpWithError() throws {
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }

    func testDoValidLogin(){
        let result = loginViewModel.doValidLogin(emailID: "abc@abc.com", passwordID: "1234567")
        XCTAssertTrue(result)
    }
    
    func testDoValidLoginWithInvalidEmail(){
        let result = loginViewModel.doValidLogin(emailID: "abcabc.com", passwordID: "1234567")
        XCTAssertFalse(result)
    }
    
    func testDoValidLoginWithInvalidPassword(){
        let result = loginViewModel.doValidLogin(emailID: "abc@abc.com", passwordID: "1234")
        XCTAssertFalse(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
