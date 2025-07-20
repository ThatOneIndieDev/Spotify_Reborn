//
//  Product.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: String 
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mockProduct: Product {
        Product(
            id: 123,
            title: "Example",
            description: "This is a mock product",
            category: "A category",
            price: 999,
            discountPercentage: 20,
            rating: 8,
            stock: 6,
            brand: "Wow Brand",
            images: [Constants.randomImage,Constants.randomImage,Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
    
}


struct ProductRow: Identifiable{
    let id = UUID().uuidString
    let title: String
    let products: [Product]

}
