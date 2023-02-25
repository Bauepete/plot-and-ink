//
//  MdReader.swift
//  
//
//  Created by Peter Bauer on 21.02.23.
//
import Files
import Ink
import Plot
import AppKit

struct MarkDownContent {
    var target: Modifier.Target
    var text: String
}

func parseMdFile() -> String {
    var aboutMd: String?
    do {
        aboutMd = try readMd()
    } catch {
        print("Pfui")
    }
    var parser = MarkdownParser()
    
//    let mdParagraphsAsHtmlParagraphs = Modifier(target: .paragraphs) {
//        html, markdown in
//        let paragraphs = markdown.split(omittingEmptySubsequences: true) {
//            $0.isNewline
//        }
//
//        let cleanedParagraphs = paragraphs.map { $0.trimmingCharacters(in: .whitespaces).isEmpty ? "" : ("<p>\($0)</p>") }.joined(separator: "\n")
//        return cleanedParagraphs
//    }
//    parser.addModifier(mdParagraphsAsHtmlParagraphs)
    
    if let aboutMd = aboutMd {
        let result = parser.parse(aboutMd)
        // let node = Node<HTML.BodyContext>(stringLiteral: result.html)
        return result.html
    } else {
        return ""
    }
}

func readMd() throws -> String {
    let folderStruct = try Folder(path: preferences.path + "/Content")
    let fileStruct = try folderStruct.file(named: "about.md")
    let mdContent = try fileStruct.readAsString(encodedAs: .utf8)
    return mdContent
}
