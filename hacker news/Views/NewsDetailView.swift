//
//  NewsDetailView.swift
//  hacker news
//
//  Created by Osama Buzdar on 09/09/2022.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(url: "https://www.google.com")
    }
}


struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
    
}
