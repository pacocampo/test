//
//  iPhoneMenuViewController.swift
//  rappi
//
//  Created by Francisco Ocampo Romero on 21/02/16.
//  Copyright © 2016 coldhandslabs. All rights reserved.
//

import UIKit

class iPhoneMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  //Outlets
  @IBOutlet weak var tableview: UITableView!

  //Attributes
  let categories : [String] = ["Games", "Photo & Video", "Social Networking", "Chat", "Entertainment", "Music", "Education", "Travel", "Navigation"]

  //Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  //MARK: Table stuff
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
    let label = UILabel(frame: CGRect(x: 20, y: 5, width: 300, height: 40))
    label.text = categories[indexPath.row]
    cell.addSubview(label)
    
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
  
//  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Apps") as! AppsViewController
//    vc.category = categories[indexPath.row]
//  }
//  //MARK: Navitation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let cell    = tableview.indexPathForSelectedRow!
    let vc      = segue.destinationViewController as! AppsViewController
    vc.category = categories[cell.row]
  }
  

}
