//
//  AnimationController.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/20/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class ToUserDetailAnimationController : NSObject {
  
}


extension ToUserDetailAnimationController : UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    return 0.4
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    //this is the animation
    if let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? UserSearchViewController,
      toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as? UserDetailViewController {
        let containerView = transitionContext.containerView()
        
        toVC.view.alpha = 0
        containerView.addSubview(toVC.view)
        
        let indexPath = fromVC.collectionView.indexPathsForSelectedItems().first as! NSIndexPath
        let userCell = fromVC.collectionView.cellForItemAtIndexPath(indexPath) as! UserCell
        
        let snapShot = userCell.avatarImageView.snapshotViewAfterScreenUpdates(false)
        snapShot.frame = containerView.convertRect(userCell.avatarImageView.frame, fromCoordinateSpace: userCell.avatarImageView.superview!)
        
        containerView.addSubview(snapShot)
        userCell.hidden = true
        //ensure that my destination image view is in place
        toVC.view.layoutIfNeeded()
        toVC.imageView.hidden = true
        let destinationFrame = toVC.imageView.frame
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
          snapShot.frame = destinationFrame
          toVC.view.alpha = 1
          }, completion: { (finished) -> Void in
            userCell.hidden = false
            toVC.imageView.hidden = false
            snapShot.removeFromSuperview()
            if finished {
              transitionContext.completeTransition(finished)
            } else {
              transitionContext.completeTransition(finished)
            }
    })
    
    
  }
}