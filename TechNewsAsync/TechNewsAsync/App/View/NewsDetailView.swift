//
//  NewsDetailView.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import SwiftUI

struct NewsDetailView: View {
    
    var imageURL : String
    var title : String
    var author : String
    var content : String
    var publishedAt : String
    var url : String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: imageURL)) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Rectangle()
                        .frame(height: Screen.screenHeight / 2.5)
                        .padding()
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(title)
                            .customRoundedFont(style: .title3)
                            .fontWeight(.bold)
                        Text(content)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("Author: \(author.uppercased())")
                            .foregroundColor(.gray)
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("Published: \(publishedAt.shortDate() ?? "")")
                            .foregroundColor(.gray)
                            .font(.caption)
                            .fontWeight(.bold)
                        Link(destination: URL(string: url)!) {
                            Text("Source: \(url)")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(imageURL: "", title: "Lorem ipsum dolor sir amet", author: "John Dhoe", content: "A struct is a value type, but a class is a reference type. This is one of the most fundamental distinctions. Although this may be a blog article in and of itself, a brief explanation should suffice to grasp the difference.", publishedAt: "12/25/2022", url: "")
    }
}
