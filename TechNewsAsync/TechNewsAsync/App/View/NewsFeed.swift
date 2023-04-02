//
//  ContentView.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = NewsViewModel()
    var body: some View {
        let newsModel = vm.newsModel
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(newsModel?.articles ?? [], id:\.self) { news in
                    NavigationLink {
                        NewsDetailView(imageURL: news.urlToImage ?? "",
                                       title: news.title,
                                       author: news.author ?? "",
                                       content: news.content ?? "",
                                       publishedAt: news.publishedAt,
                                       url: news.url)
                    } label: {
                        NewsCard(NewsUrl: news.urlToImage ?? "",
                                 title: news.title,
                                 author: news.author ?? "N/A",
                                 publishedDate: news.publishedAt)
                    }
                }
            }
        }
        .task {
            await vm.getNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: NewsViewModel())
    }
}


enum Background {
    static let darkGrayTheme = Color(red: 150/255, green: 150/255, blue: 150/255)
}

