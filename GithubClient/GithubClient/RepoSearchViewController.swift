//
//  RepoSearchViewController.swift
//  GithubClient
//
//  Created by Kristen Kozmary on 8/17/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

import UIKit

class RepoSearchViewController: UIViewController {
  var repo = [Repos]()
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.estimatedRowHeight = 70
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.delegate = self
      tableView.dataSource = self
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
  override func viewWillAppear(animated: Bool) {
    tableView.reloadData()
  }
}


extension RepoSearchViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    GithubService.repositoriesForSearchTerm(searchBar.text, completionHandler: { (errorDescription, repos) -> (Void) in
      if let error = errorDescription {
      }
      if let repos = repos {
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          self.repo = repos
          println(repos[0].name)
          self.tableView.reloadData()
        })     
      }
    })
    }
  }


extension RepoSearchViewController : UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.repo.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("RepoSearchCell", forIndexPath: indexPath) as! RepoCell
    cell.nameLabel.text = repo[indexPath.row].name
    cell.descriptionLabel.text = repo[indexPath.row].description
    cell.languageLabel.text = repo[indexPath.row].language
  return cell
}
}

extension RepoSearchViewController : UITableViewDelegate {
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    self.performSegueWithIdentifier("repoPressed", sender: self)
  }
}








