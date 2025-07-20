//
//  SpotifyRecentCell.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some Random Title"
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .lineLimit(2)
        }
        .themeColors(isSelected: false)
        .padding(.trailing, 8)
        .frame(width: 190, alignment: .leading)
        .background(Color.spotifyDarkGrey)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.edgesIgnoringSafeArea(.all)
        
        VStack{
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            
            HStack{
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
        
    }
}
