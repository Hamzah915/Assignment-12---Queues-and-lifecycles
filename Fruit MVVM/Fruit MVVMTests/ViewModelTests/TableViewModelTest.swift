//
//  TableViewModelTest.swift
//  Fruit MVVMTests
//
//  Created by Hamzah Azam on 16/04/2023.
//

import XCTest
@testable import Fruit_MVVM

final class TableViewModelTest: XCTestCase {
    
    var tableViewModel: ListViewModel!
    
    
    override func setUpWithError() throws {
        tableViewModel = ListViewModel(anyManager: FakeNetworkManager())
    }
    
    override func tearDownWithError() throws {
        tableViewModel = nil
    }
    
    // Faking test case
        func test_GetData_UsingClosures_WithGoodInputs_ForFruits_viaFaking() throws{
            tableViewModel = ListViewModel(anyManager: FakeNetworkManager())
            tableViewModel.getDataUsingClosures(url: "FruitFile")


            let expectation = expectation(description: "Getting the list of fruits")
            let waitDuration = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
                XCTAssertEqual(self.tableViewModel.fruits.count, 40)

                guard let user = self.tableViewModel.fruits.first else {return}
                XCTAssertEqual(user.name, "Persimmon")
                XCTAssertEqual(user.id, 52)
                XCTAssertEqual(user.family, "Ebenaceae")
                XCTAssertEqual(user.genus, "Diospyros")
                XCTAssertEqual(user.order, "Rosales")
                XCTAssertEqual(user.nutritions.calories, 81)
                XCTAssertEqual(user.nutritions.fat, 0.0)
                XCTAssertEqual(user.nutritions.protein, 0.0)
                XCTAssertEqual(user.nutritions.sugar, 18.0)
                XCTAssertEqual(user.nutritions.carbohydrates, 18.0)

                expectation.fulfill()
            }
            wait(for: [expectation], timeout: waitDuration)

        }
        
    func test_GetData_UsingClosures_WithGoodInputs_ForUsers() throws{
//        tableViewModel = ListViewModel(anyManager: FakeNetworkManager.self as! NetworkProtocol)
        
    }
    
    
    
    
    // mocking test case
    func test_GetData_UsingClosures_WithGoodInputs_forFruits_viaMocking() throws{
        tableViewModel = ListViewModel(anyManager: MockingNetworkManager.self as! NetworkProtocol)
        tableViewModel.getDataUsingClosures(url: "FruitFile")
        let expectation = expectation(description: "Getting the list of fruits")
        let waitDuration = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration){
            XCTAssertEqual(self.tableViewModel.fruits.count, 10)
            
            let user = self.tableViewModel.fruits[0]
            XCTAssertEqual(user.name, "Payam")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)

    }

        

        
        
        
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
        
}

