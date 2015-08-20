//
//  GithubJSONParser.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/18/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class RepoJSONParser {
  class func outputFromJSONData(jsonData : NSData) -> [Repos]? {
    var error : NSError?
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject] {
      var repoResults = [Repos]()

      if let items = rootObject["items"] as? [[String : AnyObject]] {
        for githubObject in items {
           if let name = githubObject["name"] as? String,
          url = githubObject["url"] as? String,
          language = githubObject["language"] as? String,
          ownerInfo = githubObject["owner"] as? [String : AnyObject],
          avatar_url = ownerInfo["avatar_url"] as? String {
            var repoResult = Repos(name: name, url: url, language: language)
            repoResults.append(repoResult)
            }
          }
        }
        return repoResults
      }
      return nil
    }
  }


