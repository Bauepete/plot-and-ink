//
//  Page.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import Plot

struct Page {
    var structure: Structure = DefaultStructure()
    var content: String = ""
    
    func render() -> String {
        return structure.render()
    }
}

protocol Structure {
    func render() -> String
}

struct DefaultStructure: Structure {
    func render() -> String {
        return ""
    }
    
    
}
