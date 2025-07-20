//
//  ImageTitleRowCell.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 01/07/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some item name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGrey)
                .lineLimit(2)
                .padding(4)
            
        }
        .frame(width: imageSize)
    }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea(edges: .all)
        ImageTitleRowCell()
    }

}
