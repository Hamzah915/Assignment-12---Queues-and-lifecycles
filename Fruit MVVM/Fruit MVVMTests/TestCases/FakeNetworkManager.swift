//
//  FakeNetworkManager.swift
//  Fruit MVVMTests
//
//  Created by Hamzah Azam on 16/04/2023.
//

import Foundation
@testable import Fruit_MVVM

class FakeNetworkManager:NetworkProtocol{
    func getDataFromAPIUsingClosure<T>(with urlString: String, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
            let bundle = Bundle(for: FakeNetworkManager.self)
            let url = bundle.url(forResource: "FruitFile", withExtension: "json")
            guard let url = url else {
                print("DEBUG: ERROR FAILED TO GER URL")
                return
            }
            do{
                let data = try Data(contentsOf: url)
                let userlist = try JSONDecoder().decode(T.self, from: data)
                handler(.success(userlist))
            }catch{
                
                print("DEBUG: ",error.localizedDescription)
            }
        }
}

