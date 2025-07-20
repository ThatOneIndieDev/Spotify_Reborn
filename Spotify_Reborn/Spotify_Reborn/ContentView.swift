//
//  ContentView.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    Text(product.title)
                    }
                }
            }
            .padding()
            .task {
                await getData()
        }
    }
    
    private func getData() async {
        do{
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        }catch {
            
        }
    }
}

#Preview {
    ContentView()
}
