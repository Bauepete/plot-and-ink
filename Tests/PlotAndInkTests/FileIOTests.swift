//
//  ContentPathToFileMapperTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk
import Files

final class FileIOTests: XCTestCase {
    private let testFolderLocation = Folder.current
    private let testFolderName = "PnITestFiles"
    private var testFolder: Folder!
    
    func testThatItShouldTryToAccessContentFileInDirectoryPnI_GivenPreferencesTellsSo() throws {
        let testFolderHome = "\(testFolderLocation.url.path)/\(testFolderName)"
        let preferences = Preferences(withProjectRoot: testFolderHome)

        testFolder = try createTestFolders()
        
        let contentFileName = "AnyFile.md"
        let file = try testFolder.subfolder(named: "Content").createFile(named: contentFileName)
        try file.write("# Hui")

        let fileIO = FileIO(using: preferences)
        let mdAsString = try fileIO.readContent(fromFile: contentFileName)

        XCTAssertEqual(mdAsString, "# Hui")
        
        try testFolder.delete()
    }
    
    private func createTestFolders() throws -> Folder {
        let testFolderHome = try testFolderLocation.createSubfolderIfNeeded(withName: testFolderName)
        try testFolderHome.createSubfolderIfNeeded(withName: "Content")
        try testFolderHome.createSubfolderIfNeeded(withName: "Layout")
        try testFolderHome.createSubfolderIfNeeded(withName: "Public")
        try testFolderHome.createSubfolderIfNeeded(withName: "Structure")
        return testFolderHome
    }
    
    func testThatItShouldAddContentAndAboutMd_GivenTheDefaultPreferencesAndContentPathAbout() throws {
        //        try Preferences.set(projectRoot: ".")
        //        let filePath = ContentPathToFileMapper().map("About")
        //        XCTAssertEqual(filePath, "./Content/About.md")
    }
}
