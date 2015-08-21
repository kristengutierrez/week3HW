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
  
  let imageQueue = NSOperationQueue()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    collectionView.dataSource = self
    navigationController?.delegate = self
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
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.delegate = self
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.delegate = nil
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowUserDetail" {
      if let destination = segue.destinationViewController as? UserDetailViewController,
        indexPath = collectionView.indexPathsForSelectedItems().first as? NSIndexPath {
          let user = users[indexPath.row]
          destination.selectedUser = user
      }
    }
  }
  //  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
  //    var error : NSError?
  //    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error) {
  //      let match = regex.numberOfMatchesInString(text, options: nil, range: NSRange(location: 0, length: count(text)))
  //      return match > 0 ?  false : true
  //    }
  //    return text.validateForURL()
  //  }
  
}

extension UserSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    GithubService.userForSearchTerm(searchBar.text, completionHandler: { (error, users) -> (Void) in
      if let error = error {
        
      } else if let users = users {
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          self.searchBar.resignFirstResponder()
          self.users = users
          self.collectionView.reloadData()
        })
      }
    })
  }
  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    return text.validateForURL()
  }
}

extension UserSearchViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    println(self.users.count)
    return self.users.count
  }
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
    cell.avatarImageView.image = nil
    cell.hidden = false
    cell.alpha = 0
    
    
    cell.tag++
    let tag = cell.tag
    
    var user = users[indexPath.row]
    if let image = user.image {
      cell.avatarImageView.image = image
    } else {
      
      ImageService.fetchProfileImageURL(user.avatarURL, imageQueue: imageQueue, completionHandler: { (image) -> () in
        user.image = image
        self.users[indexPath.row] = user
        if cell.tag == tag {
            cell.avatarImageView.image = user.image
            UIView.animateWithDuration(0.3, animations: { () -> Void in
              cell.alpha = 1
            })
        }
      })
    }
    return cell
  }
}

extension UserSearchViewController : UINavigationControllerDelegate {
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    return toVC is UserDetailViewController ? ToUserDetailAnimationController() : nil
    
  }
}
