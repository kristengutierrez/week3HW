//
//  UserSearchViewController.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/20/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
  var users = [User]()
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  
  @IBOutlet weak var collectionView: UICollectionView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserSearchViewController : UISearchBarDelegate {
  
  
}

extension UserSearchViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.users.count
  }
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
  }
}
