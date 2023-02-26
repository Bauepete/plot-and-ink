//
//  Preferences.swift
//  
//
//  Created by Peter Bauer on 21.02.23.
//

struct Preferences {
    let projectRoot: String
    /// Returns content root of the current project
    var contentRoot: String { "\(projectRoot)/Content" }
    var layoutRoot: String { "\(projectRoot)/Layout" }
    var publicRoot: String { "\(projectRoot)/Public" }
    var structureRoot: String { "\(projectRoot)/Structure" }
    
    init(withProjectRoot projectRoot: String = ".") {
        self.projectRoot = projectRoot
    }
}
