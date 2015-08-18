//
//  GithubJSONParser.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/18/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class GithubJSONParser {
  class func outputFromJSONData(jsonData : NSData) -> [GithubSearch]? {
    var error : NSError?
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject] {
      var githubResults = [GithubSearch]()

      if let items = rootObject["items"] as? [[String : AnyObject]] {
        for githubObject in items {
           if let name = githubObject["name"] as? String,
          description = githubObject["description"] as? String,
          url = githubObject["url"] as? String,
          language = githubObject["language"] as? String,
          ownerInfo = githubObject["owner"] as? [String : AnyObject],
          avatar_url = ownerInfo["avatar_url"] as? String {
            var githubResult = GithubSearch(name: name, avatar_url: avatar_url, url: url, description: description, language: language, profileImage: nil)
            
            if let imageURL = NSURL(string: githubResult.avatar_url!),
            imageData = NSData(contentsOfURL: imageURL),
              image = UIImage(data: imageData) {
                githubResult.profileImage = image
                githubResults.append(githubResult)
            }
          }
        }
        return githubResults
      }
    }
    return nil
  }
}

