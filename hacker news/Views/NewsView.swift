//
//  ContentView.swift
//  hacker news
//
//  Created by Osama Buzdar on 09/09/2022.
//

import SwiftUI
import CoreData

struct NewsView: View {
    
    @ObservedObject var newsManager = NewsManager()
    
    var body: some View {
       
        NavigationView {
            List(newsManager.posts) { post in
                NavigationLink(destination: NewsDetailView(url: post.url)){
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.newsManager.fetchNewsData()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
        }
    }


