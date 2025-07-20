import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release"
    var category: String? = "Category"
    var subheadline: String? = "Artist Name"
    var title: String? = "Artist Playlist"
    var subTitle: String? = "Single - Title"
    var onAddToPlayPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4){
                    Text(subheadline ?? "")
                        .font(.callout)
                        .foregroundColor(.spotifyLightGrey)
                    
                    Text(headline ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.spotifyWhite)
                    

                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 175, height: 175)
                
                VStack(alignment: .leading, spacing: 4){
                    Text(title ?? "")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.spotifyWhite)
                    
                    Text(subTitle ?? "")
                        .font(.caption)
                        .foregroundColor(.spotifyLightGrey)
                    
                    HStack(spacing: 140){
                        Image(systemName: "plus")
                            .foregroundStyle(.spotifyLightGrey)
                            .background(
                                Circle()
                                    .stroke(.spotifyLightGrey, lineWidth: 2)
                                    .frame(width: 25, height: 25)
                            )
                        
                        Image(systemName: "play.fill")
                            .foregroundStyle(.spotifyBlack)
                            .background(
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 25, height: 25)
                            )
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                }
            }
            .background(Color.spotifyDarkGrey)
            .cornerRadius(8)

            
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea(edges: .all)
        
        SpotifyNewReleaseCell()
    }
}
