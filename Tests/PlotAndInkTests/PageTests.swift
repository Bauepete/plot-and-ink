//
//  PageTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk

final class PageTests: XCTestCase {
    private struct TestStructure: Structure {
        func render() -> String {
            return "test structure's render was called"
        }
    }
    
    func testThatItShouldAcceptStructureAndContent_GivenConstructed() {
        let structure = TestStructure()
        let md = """
# Headline
and a text
"""
        let page = Page(structure: structure, content: md)
        XCTAssertNotNil(page.structure)
    }
    
    func testThatItShouldCallStructureRender_GivenRenderIsCalled() {
        let page = Page(structure: TestStructure())
        let result = page.render()
        XCTAssertEqual(result, "test structure's render was called")
    }
    
    func testThatItShouldRenderHelloWorld_GivenConstructedByDefault() {
        let page = Page()
        
        let expectedResult = "<!DOCTYPE html><html><head><title>Hello, World</title><meta name=\"twitter:title\" content=\"Hello, World\"/><meta name=\"og:title\" content=\"Hello, World\"/></head><body><h1>Hello, World</h1></body></html>"
        
        XCTAssertEqual(page.render(), expectedResult)
    }
}
