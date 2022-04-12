//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import SwiftUI

@main
struct NewsAppApp: App {
    @StateObject var savedNews = SavedNews();
    
    var body: some Scene {
        WindowGroup {
            TabView{
                NewsView(newsVM: NewsViewModel())
                    .tabItem{
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }.environmentObject(savedNews)
                SavedView()
                    .tabItem{
                        Image(systemName: "heart.fill")
                        Text("Saved")
                    }.environmentObject(savedNews)
            }
            
        }
    }
}

class SavedNews: ObservableObject {
    @Published var news:[News] = []
}
