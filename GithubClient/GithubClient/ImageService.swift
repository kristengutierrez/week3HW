//
//  ImageService.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/20/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class ImageService {
  class func fetchProfileImageURL(url: String, imageQueue: NSOperationQueue, completionHandler: (UIImage?) -> ()) {
    imageQueue.addOperationWithBlock { () -> Void in
      if let url = NSURL(string: url) {
        if let imageData = NSData(contentsOfURL: url){
          if let image = UIImage(data: imageData) {
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
              completionHandler(image)
            })
          }
        }
      }
    }
  }
  
}
