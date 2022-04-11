//
//  NewsSetting.swift
//  NewsApp
//
//  Created by Ivan Christian on 10/04/22.
//

import SwiftUI

struct NewsSetting: View {
    let categories = ["Top", "New", "Popular"]
    @State var selected = ""
    var body: some View {
        Form{
            Section{
                Picker("News Category", selection: $selected) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
            }
        }
    }
}

//struct NewsSetting_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsSetting()
//    }
//}
