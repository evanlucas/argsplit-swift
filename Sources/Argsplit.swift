//
//  Argsplit.swift
//  Argsplit
//
//  Created by Evan Lucas on 12/6/15.
//  Copyright © 2015 Evan Lucas. All rights reserved.
//

import Foundation

public struct Argsplit {
  private var input:String
  
  public init(inputString:String) {
    self.input = inputString
  }
  
  private func stripStr(_ str:String) -> String {
    let newStr = str.replacingOccurrences(of: "  ", with: " ")
    return newStr
  }
  
  public func parse() -> Array<String> {
    var newStr:String
    
    newStr = stripStr(self.input)
    
    if newStr == "" {
      return []
    }
    
    var out = [String]()
    var quoteChar = ""
    var current = ""
    
    for c in newStr.characters {
      if c == " " {
        if quoteChar.characters.count > 0 {
          current += String(c)
        } else {
          if current.characters.count > 0 {
            out.append(current)
            current = ""
          }
        }
      } else if c == "'" || c == "\"" {
        if quoteChar.characters.count > 0 {
          if quoteChar == String(c) {
            current += String(c)
            out.append(current)
            quoteChar = ""
            current = ""
          } else if quoteChar == "'" || quoteChar == "\"" {
            current += String(c)
          } else {
            current += String(c)
            quoteChar = String(c)
          }
        } else {
          current += String(c)
          quoteChar = String(c)
        }
      } else {
        current += String(c)
      }
    }
    
    if current.characters.count > 0 {
      out.append(current)
    }
    
    return out
  }
}
