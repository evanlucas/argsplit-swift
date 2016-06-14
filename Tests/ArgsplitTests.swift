//
//  ArgsplitTests.swift
//  ArgsplitTests
//
//  Created by Evan Lucas on 12/6/15.
//  Copyright © 2015 Evan Lucas. All rights reserved.
//

import XCTest
@testable import Argsplit

class ArgsplitTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
    
  override func tearDown() {
    super.tearDown()
  }
    
  func testBasicArgs() {
    let input = "git clone https://github.com/evanlucas/node-launchctl.git"
    let out = Argsplit(inputString: input).parse()
    let exp = ["git", "clone", "https://github.com/evanlucas/node-launchctl.git"]
    XCTAssertEqual(out, exp)
  }
  
  func testArgsWithDoubleQuotes() {
    let input = "npm config set init.author.name \"Evan Lucas\" --verbose"
    let out = Argsplit(inputString: input).parse()
    let exp = ["npm"
      , "config"
      , "set"
      , "init.author.name"
      , "\"Evan Lucas\""
      , "--verbose"
    ]
    XCTAssertEqual(out, exp)
  }
  
  func testArgsWithSingleQuotes() {
    let input = "npm config set init.author.name 'Evan Lucas' --verbose"
    let out = Argsplit(inputString: input).parse()
    let exp = ["npm"
      , "config"
      , "set"
      , "init.author.name"
      , "'Evan Lucas'"
      , "--verbose"
    ]
    XCTAssertEqual(out, exp)
  }
  
  func testArgsWithNestedQuotes() {
    let input = "npm config set name \"Evan 'Hereford' Lucas\" --verbose"
    let out = Argsplit(inputString: input).parse()
    let exp = ["npm"
      , "config"
      , "set"
      , "name"
      , "\"Evan 'Hereford' Lucas\""
      , "--verbose"
    ]
    XCTAssertEqual(out, exp)
  }
  
  func testArgsWithNestedSingleQuotes() {
    let input = "npm config set name 'Evan \"Hereford\" Lucas' --verbose"
    let out = Argsplit(inputString: input).parse()
    let exp = ["npm"
      , "config"
      , "set"
      , "name"
      , "'Evan \"Hereford\" Lucas'"
      , "--verbose"
    ]
    XCTAssertEqual(out, exp)
  }
  
  func testBlankString() {
    let input = ""
    let out = Argsplit(inputString: input).parse()
    XCTAssertEqual(out, [])
  }
  
  func testPerformanceExample() {
    var i = 0
    self.measure {
      repeat {
        let input = "git clone https://github.com/evanlucas/node-launchctl.git"
        _ = Argsplit(inputString: input).parse()
        i += 1
      } while i < 100
    }
  }
}
