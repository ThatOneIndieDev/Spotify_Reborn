//
//  Spotify_RebornApp.swift
//  Spotify_Reborn
//
//  Created by Syed Abrar Shah on 30/05/2025.
//

import SwiftUI
import SwiftfulRouting // Routing to be completed and done

@main
struct Spotify_RebornApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView{ _ in
                ContentView()
            }
        }
    }
}
