//
//  RepoSearchViewController.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/17/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class RepoSearchViewController: UIViewController {
  
  
  @IBOutlet weak var searchBar: UISearchBar!
  

    override func viewDidLoad() {
        super.viewDidLoad()

      
      searchBar.delegate = self
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


extension RepoSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//    GithubService.repositoriesForSearchTerm(searchBar.text
//      (searchTerm, in
//      println("worked")
    GithubService.repositoriesForSearchTerm(searchBar.text, completionHandler: { (errorDescription, repos) -> (Void) in
      if let error = errorDescription {
        
      }
    })
    }
  }














