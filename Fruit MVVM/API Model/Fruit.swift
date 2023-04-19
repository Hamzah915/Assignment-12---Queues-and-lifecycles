//
//  Fruit.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import Foundation

struct  Fruit:Decodable{
    let name: String
    let id: Int
    let family: String
    let order: String
    let genus: String
    let nutritions: Nutritions
}
struct Nutritions:Decodable{
        let calories: Int
        let fat: Double
        let sugar: Double
        let carbohydrates: Double
        let protein: Double
}
