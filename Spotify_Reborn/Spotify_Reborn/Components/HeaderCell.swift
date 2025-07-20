//
//  HeaderBar.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import SwiftUI

struct HeaderCell: View {
    
    var isSelected: Bool = false
    var title: String = "all"
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected) 
            .cornerRadius(16)
            
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
    
}

#Preview {
    ZStack {
        Color.spotifyBlack.edgesIgnoringSafeArea(.all)
        HeaderCell()
    }
}
