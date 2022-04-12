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
    @EnvironmentObject var savedNews : SavedNews;
    
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
                                savedNews.news.append(post)
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
                    Menu{
                        Button{
                            newsVM.changeCountry("ID")
                        }label: {
                            if(newsVM.country == "ID"){
                                Label("Indonesia", systemImage: "checkmark")
                            }else{
                                Text("Indonesia")
                            }
                        }
                        Button{
                            newsVM.changeCountry("US")
                        }label: {
                            if(newsVM.country == "US"){
                                Label("United States", systemImage: "checkmark")
                            }else{
                                Text("United States")
                            }
                        }
                    }label: {
                        Image(systemName: "flag.fill")
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
