//
//  SpotifyHomeView.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCatagory: Catagory? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders]){ // header will remained pinned
                    Section(header: Header){
                        
                        VStack{
                            recentsSection
                            
                            if let product = products.first{
                                newReleaseSection(product: product)
                            }
                            
                        }
                        .padding(.bottom)
                    }
                    ListRows
                }
            }
        }
        .clipped()
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    
    
    private func getData() async {
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands{
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        }catch {
            
        }
    }

    private var Header: some View {
        HStack(spacing: 0){
            ZStack{
                if let currentUser{
                    ImageLoaderView(urlString: currentUser.image)
                        .background(Color.white)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            .padding(.leading, 8)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(Catagory.allCases, id: \.self){ c in
                        HeaderCell(
                            isSelected: c == selectedCatagory, title: c.rawValue
                        )
                        .onTapGesture {
                            selectedCatagory = c
                        }
                    }
                }
            }
        }
        .padding(.vertical, 24)
        .padding(.leading,8)
        .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10,  items: products){ product in
            if let product {
                SpotifyRecentCell(imageName: product.firstImage, title: product.title
                )
                .asButton(.press) {
                        
                }
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: "Album",
            subheadline: "Artist",
            title: product.title,
            subTitle: "Artist") {
                
            } onPlayPressed: {
                
            }

    }
    
    private var ListRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8){
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top ,spacing:16) {
                        ForEach(row.products) {product  in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                }
            }
        }
    }

    
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea(edges: .all)
        SpotifyHomeView()
    }
}
