//
//  ContentView.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var newsVM : NewsViewModel
    @State private var showFullArticle = false;
    @State private var articleURL = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(newsVM.posts, id: \.self) { post in
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
            
            .sheet(isPresented: $showFullArticle) {
                WebView(url: (URL(string : articleURL) ?? URL(string : "google.com"))!)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Top News")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        print("masok")
                        newsVM.changeCategory(category: "ID")
                    }label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
        
        
//        .overlay(

//                .scaledToFit()
//                .frame(width: 30, height: 30)
//                .clipShape(Circle())
//                .padding(.trailing, 30)
//                .offset(x: 0, y: -40)
//
//            ,alignment: .topTrailing)
//
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsVM: NewsViewModel())
    }
}
