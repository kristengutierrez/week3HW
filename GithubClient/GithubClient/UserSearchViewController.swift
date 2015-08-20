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
  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
//    var error : NSError?
//    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error) {
//      let match = regex.numberOfMatchesInString(text, options: nil, range: NSRange(location: 0, length: count(text)))
//      return match > 0 ?  false : true
//    }
    return text.validateForURL()
  }

}

extension UserSearchViewController : UISearchBarDelegate {
  
  
}

extension UserSearchViewController : UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.users.count
  }
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//    cell.avatarImageView.image = nil
//    cell.hidden = false
//    cell.alpha = 0
//    
//    
//    cell.tag++
//    let tag = cell.tag
//    
//    var user = users[indexPath.row]
//    if cell.tag == tag {
//    cell.avatarImageView.image = user.image
//    
//    UIView.animateWithDuration(0.3, animations: { () -> Void in
//      cell.alpha = 1
//    })
//    }
  }
}

extension UserSearchViewController : UINavigationControllerDelegate {
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    return toVC is UserDetailViewController ? ToUserDetailAnimationController() : nil
    
  }
}
