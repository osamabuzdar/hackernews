//
//  NewsManager.swift
//  hacker news
//
//  Created by Osama Buzdar on 09/09/2022.
//

import Foundation

class NewsManager: ObservableObject {
    
    @Published var posts = [Posts]()
    
    func fetchNewsData() {
        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        
        if let url = url {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decodar = JSONDecoder()
                    if let safeData = data {
                    do{
                        let result = try decodar.decode(NewsModel.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                        
                    }catch{
                        print(error, terminator: "")
                        }
                    }
                }
            }.resume()
        }
    }
}
