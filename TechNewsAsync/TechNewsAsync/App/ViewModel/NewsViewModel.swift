//
//  NewsViewModel.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import Foundation




class NewsViewModel : ObservableObject {
    
    @Published var newsModel : NewsModel?
    
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=abfc00d5f4334b0292bada0c7478a094"
    
    func getNews() async -> Void {
        
        guard let url = URL(string: newsURL) else {
            print("DEBUG: URL does not working...")
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            //status code response
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response with code \(response.statusCode)")
            }
            //decode
            if let decodedResponse = try? JSONDecoder().decode(NewsModel.self, from: data) {
                DispatchQueue.main.async {
                    self.newsModel = decodedResponse
                }
                print("DEBUG: Success decode with data \(decodedResponse as Any)")
            }
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
    
}


