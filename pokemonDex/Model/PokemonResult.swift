//
//  PokemonResult.swift
//  pokemonDex
//
//  Created by X Y on 5/1/21.
//

import Foundation
struct PokemonResult: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
    
}

struct PokemonData: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites?
}

struct Sprites: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
    }
}
