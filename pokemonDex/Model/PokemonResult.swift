//
//  PokemonResult.swift
//  pokemonDex
//
//  Created by X Y on 5/1/21.
//

import Foundation
struct PokemonResult: Decodable {
    let next: String?
    let previous: String?
    let result: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
    
}
