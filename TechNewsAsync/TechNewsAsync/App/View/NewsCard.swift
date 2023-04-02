//
//  NewsCard.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 04/12/22.
//

import SwiftUI

struct NewsCard : View {
    
    let NewsUrl : String
    let title : String
    let author : String
    let publishedDate : String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: NewsUrl)) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    HStack {
                        Text(author.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(publishedDate.shortDate() ?? "")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Background.darkGrayTheme,lineWidth: 1)
        }
        .padding([.top, .horizontal])
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        
        NewsCard(NewsUrl: "N/A", title: "Chinese new virus?", author: "Johnson Mark", publishedDate: "3/1/2005")
    }
}
