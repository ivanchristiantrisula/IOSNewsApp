//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                NewsView(newsVM: NewsViewModel())
                    .tabItem{
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }
                SavedView(savedVM: SavedViewModel())
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Saved")
                    }
            }
            
        }
    }
}
