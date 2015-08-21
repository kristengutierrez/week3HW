//
//  GithubService.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/17/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import Foundation

class GithubService {
  class func repositoriesForSearchTerm(searchTerm : String, completionHandler : (String?, [Repos]?) -> (Void)) {
    let baseURL =   "https://api.github.com/search/repositories"
    let finalURL = baseURL + "?q=\(searchTerm)"
    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
    if let token = KeychainService.loadToken() {
      request.setValue("token \(token)", forHTTPHeaderField: "Authorization")

    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
        
          switch httpResponse.statusCode {
          case 200...299:
            let repositories = RepoJSONParser.outputFromJSONData(data)
            completionHandler(nil, repositories)
          case 400...499:
            completionHandler("Our fault", nil)
          case 500...599:
            completionHandler("Server's fault", nil)
          default:
            completionHandler("Something went wrong", nil)
          }
          
          //start parsing
        }
      }).resume()
    }
  }
  }
  class func userForSearchTerm(searchTerm: String, completionHandler : (String?, [User]?) -> (Void)) {
    let baseURL =   "https://api.github.com/search/users"
    let finalURL = baseURL + "?q=\(searchTerm)"
    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
    if let token = KeychainService.loadToken() {
          request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
    }
    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          switch httpResponse.statusCode {
          case 200...299:
            let users = UserJSONParser.outputFromJSONData(data)
            println(users)
            completionHandler(nil, users)
          case 400...499:
            completionHandler("Our fault", nil)
          case 500...599:
            completionHandler("Server's fault", nil)
          default:
            completionHandler("Something went wrong", nil)
          }
        }
      }).resume()
    }

  }
  
  
  
  
  
}