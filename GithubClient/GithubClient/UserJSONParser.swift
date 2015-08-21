//
//  UserJSONParser.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/20/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class UserJSONParser {

  class func outputFromJSONData(jsonData : NSData) -> [User]? {
    var error : NSError?
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject] {
      var userResults = [User]()
      
      if let items = rootObject["items"] as? [[String : AnyObject]] {
        for githubObject in items {
          if let login = githubObject["login"] as? String,
            avatarURL = githubObject["avatar_url"] as? String,
            id = githubObject["id"] as? Int {
              var userResult = User(login: login, avatarURL: avatarURL, id: id, image: nil)
              userResults.append(userResult)
          }
        }
      }
      return userResults
    }
    return nil
  }
}

