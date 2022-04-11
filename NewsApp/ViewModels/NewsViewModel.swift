//
//  News.swift
//  NewsApp
//
//  Created by Ivan Christian on 09/04/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var posts : [News] = []
    @Published var country = "US"
    @Published var category = "top-headlines?"
    
    private let API_URL = "https://newsapi.org/v2/"
    private let API_KEY = "f47d1678ced14ebe92304135c1129362"
    
    init(){
        getNews()
    }
    
    func getNews() {
        callNewsAPI { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let result = result {
                
                do{
                    let decoded = try JSONDecoder().decode(APIResponse.self, from: result)
                    
                    DispatchQueue.main.async {
                        self.posts = decoded.articles
                    }
                    
                }catch{
                    print("Error decoding post \(error)")
                }
                 
            }
            
        }
    }
    
    func callNewsAPI(completion: @escaping (_ result: Data?, _ error: Error?) -> Void){
        let url = URL(string: "\(API_URL)\(category)country=\(country)&apiKey=\(API_KEY)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let data = data {
                completion(data,nil)
            }
            else if let err = err {
                completion(nil,err)
            }else{
                completion(nil,nil)
            }
        }
        
        task.resume()
    }
    
    func changeCountry(_ country : String){
        self.country = country
        getNews();
    }
    
    func saveNews(news: News){
        
    }
}

struct APIResponse: Codable {
    var articles : [News]
}
