//
//  Extensions.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/20/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import Foundation

extension String {
  func validateForURL() -> Bool {
    var error : NSError?
    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error) {
      let match = regex.numberOfMatchesInString(self, options: nil, range: NSRange(location: 0, length: count(self)))
      return match > 0 ?  false : true
    }
  }
}