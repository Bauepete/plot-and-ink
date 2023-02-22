import Files
import Plot
import Ink

let preferences = Preferences(path: "/Users/peter/Documents/junk/misc/SwiftPlotTrial/PlotAndInk/SiteData")

let htmlText = aboutPage.render(indentedBy: .spaces(4))
print(htmlText)

try writeHtml(content: htmlText, to: "bla.html", in: preferences.path)

//let htmlNode = Node<HTML.BodyContext>.raw(parseMdFile())
//let htmlNode = Node<HTML.BodyContext>(stringLiteral: parseMdFile())
//print(htmlNode.render(indentedBy: .spaces(4)))

// MARK: helper functions

func writeHtml(content htmlText: String, to file: String, in folder: String) throws {
    let folderStruct = try Folder(path: folder)
    let fileStruct = try folderStruct.createFile(at: file)
    try fileStruct.write(htmlText)
    print("Wrote to \(file)")
}
