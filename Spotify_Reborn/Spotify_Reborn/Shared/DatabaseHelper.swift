//
//  DatabaseHelper.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else { // url from dummy JSON for random filer data
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url) // The _ is the reponse we will get
        
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url) // The _ is the reponse we will get
        
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }    
}

