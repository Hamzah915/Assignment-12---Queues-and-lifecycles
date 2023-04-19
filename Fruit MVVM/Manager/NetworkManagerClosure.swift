//
//  NetworkManagerClosure.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import Foundation

class NetworkManagerClosure: NetworkProtocol{
    func getDataFromAPIUsingClosure<T>(with urlString: String, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {

        let urlString = "https://fruityvice.com/api/fruit/all"
        guard let url = URL(string: urlString) else {return}

        let session = URLSession.shared
        print("Before API")
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                handler(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error for response")
                return
            }

            guard let data = data else{
                print("could not get data from API")
                return
            }
            do{
                let userlist = try JSONDecoder().decode(T.self, from: data)
                handler(.success(userlist))
            }catch{
                print(error.localizedDescription)
                }
        }
        task.resume()
        print("End of function API")
    }
    

           
}
    

