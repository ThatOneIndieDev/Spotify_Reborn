//
//  PlaylistHeaderCell.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 01/07/2025.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title"
    var subtitle: String = "Some playlist subtitle"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        
        Rectangle() // added so the stretchy header is on the entire rectangle and not just the image
            .opacity(0)
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 8){
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(gradient: Gradient(colors: [shadowColor.opacity(0), shadowColor]), startPoint: .top, endPoint: .bottom)
                )
                ,alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack{
        Color.black.edgesIgnoringSafeArea(.all)
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
