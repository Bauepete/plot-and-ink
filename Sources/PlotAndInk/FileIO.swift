//
//  FileIO.swift
//
//
//  Created by Peter Bauer on 25.02.23.
//
import Files

struct FileIO {
    var preferences: Preferences
    
    init(using preferences: Preferences) {
        self.preferences = preferences
    }
    
    func readContent(fromFile fileName: String) throws -> String {
        let folder = try Folder(path: preferences.contentRoot)
        let file = try folder.file(named: fileName)
        let content = try file.readAsString(encodedAs: .utf8)
        return content
    }
}
