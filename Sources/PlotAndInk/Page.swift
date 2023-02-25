//
//  Page.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import Plot

struct Page {
    var structure: Structure
    var content: String
    
    init(structure: Structure = DefaultStructure(), content: String = "") {
        self.structure = structure
        self.content = content
    }
    
    func render() -> String {
        return "Render called"
    }
}

protocol Structure {
    
}

struct DefaultStructure: Structure {
    
}
