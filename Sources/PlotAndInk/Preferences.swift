//
//  Preferences.swift
//  
//
//  Created by Peter Bauer on 21.02.23.
//

enum PIError: String, Error {
    case projectRootNotSet
    case projectRootReset
}

class Preferences {
    /// Returns content root of the current project
    var contentRoot: String { "\(projectRoot)/Content" }
    var layoutRoot: String { "\(projectRoot)/Layout" }
    var publicRoot: String { "\(projectRoot)/Public" }
    var structureRoot: String { "\(projectRoot)/Structure" }

    private static var _staticProjectRoot: String?
    
    static func set(projectRoot: String) throws {
        if _staticProjectRoot == nil {
            _staticProjectRoot = projectRoot
        } else {
            throw PIError.projectRootReset
        }
    }
    
    static func reset() {
        _staticProjectRoot = nil
        _instance = nil
    }
    
    static var staticProjectRoot: String? {
        get {
            _staticProjectRoot
        }
    }

    private let _projectRoot: String
        
    init(_ projectRoot: String?) {
        if let projectRoot = projectRoot {
            self._projectRoot = projectRoot
        } else {
            self._projectRoot = ""
        }
    }
    
    static var instance: Preferences {
        get throws {
            if _instance == nil {
                if _staticProjectRoot == nil {
                    throw PIError.projectRootNotSet
                }
                _instance = Preferences(_staticProjectRoot)
            }
            return _instance
        }
    }
    
    private static var _instance: Preferences!
    
    var projectRoot: String { return _projectRoot }
}
