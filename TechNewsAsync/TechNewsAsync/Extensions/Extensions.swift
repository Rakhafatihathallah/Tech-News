//
//  Extensions.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import SwiftUI

extension View {
    //Rounded font with custom style
    func customRoundedFont(style: Font.TextStyle) -> some View {
        self
            .font(.system(style, design: .rounded))
    }
    //embed NavigationView
    @ViewBuilder
    func embedNavigation() -> some View {
        if #available(iOS 16, *) {
            NavigationStack {
                self
            }
        } else {
            NavigationView {
                self
            }
        }
    }
}

extension String {
    func shortDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let date = dateFormatter.date(from: self)
        if date == nil {
            return nil
        }
        dateFormatter.dateFormat = "yyy-MM-dd"
        return dateFormatter.string(from: date!)
    }
}


enum Screen {
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
}
