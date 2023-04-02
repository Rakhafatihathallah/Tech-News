//
//  Protocol.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 02/11/22.
//

import SwiftUI

protocol ThemeProtocol {
    var yellowTheme : Color { get }
    var mintTheme : Color { get }
}

struct Theme : ThemeProtocol {
    var yellowTheme: Color = Color.yellow
    var mintTheme: Color = Color.mint
}
