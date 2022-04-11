//
//  NewsCard.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import SwiftUI

struct NewsCard: View {
    var post : News
    
    
    
    var body: some View{
        
        ZStack(alignment: .top){
            VStack{
                Text(post.title)
                    .font(.headline)
                    .frame(maxWidth : .infinity, alignment: .leading)
                Spacer()
                HStack(alignment: .top){
                    VStack{
                        Text(post.description ?? "")
                            .font(.subheadline)
                            .frame(maxWidth : .infinity, alignment: .leading)
                    }
                    if((post.urlToImage) != nil && (post.urlToImage) != "null" ){
                        AsyncImage(url: URL(string : post.urlToImage ?? "")){image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 100, height: 100, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                    
                }
                Spacer()
                Text("\(getRelativeTime(post.publishedAt)) ~ \(post.source.name)")
                    .font(.caption2)
                    .frame(maxWidth : .infinity, alignment: .leading)
            }
            
        }
        .padding()
        .background(.regularMaterial).cornerRadius(16)
    }
}

func getRelativeTime(_ rawString : String) -> String{
    let RFC3339DateFormatter = DateFormatter()
    RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
    RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    return RFC3339DateFormatter.date(from: rawString)?.timeAgoDisplay() ?? "Unknown"
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
