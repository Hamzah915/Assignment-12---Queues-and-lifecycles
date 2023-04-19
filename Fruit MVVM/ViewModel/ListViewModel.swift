//
//  ListViewModel.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import Foundation

protocol NetworkProtocol{
    func getDataFromAPIUsingClosure<T:Decodable>(with urlString:String, handler: @escaping (Result <T,Error>) -> Void)
    
}

class ListViewModel{
    
    var fruits = [Fruit]()
    var reloadMyData:(() -> Void)?

    
    let anyManager: NetworkProtocol
    init(anyManager: NetworkProtocol) {
        self.anyManager = anyManager
    }


    func getDataUsingClosures(url:String){
        anyManager.getDataFromAPIUsingClosure (with:url){ (result: Result<[Fruit],Error>) in
            switch result {
            case .success(let fruities):
                self.fruits = fruities
                self.reloadMyData?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

