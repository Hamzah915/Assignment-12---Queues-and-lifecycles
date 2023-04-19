//
//  MockingNetworkManager.swift
//  Fruit MVVMTests
//
//  Created by Hamzah Azam on 17/04/2023.
//

import Foundation
@testable import Fruit_MVVM

class MockingNetworkManager: NetworkProtocol{
//    let resultArr = [Fruit]()
    
    func getDataFromAPIUsingClosure<T>(with urlString: String, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let mockingArray = Fruit(name: "Payam", id: 1, family: "Iran", order: "IOS", genus: "Middle-east", nutritions: Nutritions(calories: 2500, fat: 0.0, sugar: 0.0, carbohydrates: 0.0, protein: 100))
        
        handler(.success(mockingArray as! T))
//        handler(.success(resultArr as! T))

    }
    
    
}
