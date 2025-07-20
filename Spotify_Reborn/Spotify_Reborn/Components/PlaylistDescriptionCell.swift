//
//  PlaylistDescriptionCell.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 01/07/2025.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var description: String = Product.mockProduct.description
    var subDescription: String = "This is some sub description"
    var tag: String = "Tag"
    // BUTTON FUNCTIONS
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
                Text(description)
                .foregroundStyle(.spotifyLightGrey)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            MadeForYouSection
            
            Text(subDescription)
            
            Buttons
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .frame(width: .infinity)
        .padding(.horizontal, 16)
        .foregroundStyle(.spotifyLightGrey)


    }
    
    
    private var MadeForYouSection: some View {
        HStack(spacing: 8){
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text("You")
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var Buttons: some View {
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(spacing: 8){
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(Color.black.opacity(0.001))
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea(.all)
        PlaylistDescriptionCell()
    }
}
