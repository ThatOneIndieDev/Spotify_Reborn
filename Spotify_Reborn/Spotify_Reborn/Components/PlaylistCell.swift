//
//  PlaylistCell.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 01/07/2025.
//

import SwiftUI
import SwiftfulUI

struct PlaylistCell: View {
    
    var productName: String = Product.mockProduct.title
    var subtitle: String = Product.mockProduct.brand ?? ""
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: "file://'/Users/syed/Desktop/IOS DEV/Swift Reborn /Spotify Reborn/Spotify_Reborn/Spotify_Reborn/Assets.xcassets/Images/LP.imageset/LP.jpg")
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(productName)
                    .foregroundStyle(.spotifyWhite)
                
                Text(subtitle)
                    .foregroundStyle(.spotifyLightGrey)
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.spotifyWhite)
        }
        .padding(.horizontal, 16) // ✅ Optional: adds space from screen edges

    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea(.all)
        PlaylistCell()
    }
}
