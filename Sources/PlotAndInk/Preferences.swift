//
//  Preferences.swift
//  
//
//  Created by Peter Bauer on 21.02.23.
//

struct Preferences {
    var projectRoot: String
    var contentRoot: String
    var publicRoot: String
    var structureRoot: String
    var layoutRoot: String
    
    init(projectRoot: String) {
        self.projectRoot = projectRoot
        contentRoot = "\(projectRoot)/Content"
        publicRoot = "\(projectRoot)/Public"
        structureRoot = "\(projectRoot)/Structure"
        layoutRoot = "\(projectRoot)/Layout"
    }
}
