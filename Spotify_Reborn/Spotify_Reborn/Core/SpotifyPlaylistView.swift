//
//  SpotifyPlaylistView.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 01/07/2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mockProduct
    
    @State var products: [Product] = []
    @State private var showHeader: Bool = true
    @State private var Offset: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageName: "file://'/Users/syed/Desktop/IOS DEV/Swift Reborn /Spotify Reborn/Spotify_Reborn/Spotify_Reborn/Assets.xcassets/Images/LP.imageset/LP.jpg")
//                    .background(
//                        GeometryReader { geometry in
//                            Text("")
//                                .frame(maxWidth: .infinity, maxHeight: .infinity) // What this bit of code does is that it adds a background layer to the first part of this view which will have the same geometry reading as the top od the screen.
//                            
//                            // I WILL USE THE SWIFTFUL UI PACKAGE PROPERTY TO DO THE SAME THING
//                        }
//
//                    )
                    .readingFrame{ frame in
                        Offset = frame.maxY // will help me to render in header when I want it to
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescriptionCell()
                    
                    ForEach(products) { product in
                        PlaylistCell()
                    }
                }
                .task {
                    await getData()
                }
                .toolbar(.hidden, for: .navigationBar)
            }
            
            ZStack{
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.spotifyWhite)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.spotifyBlack)
                    .offset(y: showHeader ? 0: -50)
                    .opacity(showHeader ? 1: 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGrey.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
            .frame(maxHeight: .infinity, alignment: .top) // added max frame for the pre-existing frame to push it to the top of the screen.
            
        }
    }
    
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            print("Error fetching data \(error)")
        }
    }
    
}

#Preview {
    SpotifyPlaylistView()
}
