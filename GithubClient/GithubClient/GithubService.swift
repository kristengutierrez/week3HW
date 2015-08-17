//
//  GithubService.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/17/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import Foundation

class GithubService {
  class func repositoriesForSearchTerm(searchTerm : String) {
    let baseURL =   "https://api.github.com/search/repositories"
    let finalURL = baseURL + "?q=\(searchTerm)"
    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
        }
      }).resume()
    }
  }
}