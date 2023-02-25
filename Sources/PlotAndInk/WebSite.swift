//
//  WebSite.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

struct WebSite {
    private (set) var preferences: Preferences
    init(with preferences: Preferences) {
        self.preferences = preferences
    }
}
