//
//  SavedView.swift
//  NewsApp
//
//  Created by Ivan Christian on 10/04/22.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var savedVM : SavedNews;
    @State private var showFullArticle = false;
    @State private var articleURL = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(savedVM.news, id: \.self) { post in
                    NewsCard(post: post)
                        .onTapGesture {
                            articleURL = post.url
                            showFullArticle.toggle()
                        }
                        .contextMenu{
                            Button{
                                
                            } label: {
                                Label("Save", systemImage: "heart.fill")
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button{
                                
                            }label: {
                                Label("Save", systemImage: "heart.fill")
                            }.tint(.pink)
                        }
                }
                
            }
            .navigationTitle("Your List")
            .sheet(isPresented: $showFullArticle) {
                WebView(url: (URL(string : articleURL) ?? URL(string : "google.com"))!)
            }
            .listStyle(PlainListStyle())
        }
        
    }
}


//struct SavedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedView()
//    }
//}
