//
//  AppsViewController.swift
//  rappi
//
//  Created by Francisco Ocampo Romero on 20/02/16.
//  Copyright © 2016 coldhandslabs. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class AppsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  //MARK: Outlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  //MARK: Properties
  var category = ""
  let reuseIdentifier = "Cell"
  let realm = try! Realm()
  var items  = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    buildAppsViews()
      
  }
  
  private func buildAppsViews() {
    let userPredicate   = NSPredicate(format: "category = %@", category)
    let apps = realm.objects(Application).filter(userPredicate)
    items = apps.count
    
  }
  
  //MARK: Collection View Stuff
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AppsCollectionViewCell
    let userPredicate   = NSPredicate(format: "category = %@", category)
    let apps = realm.objects(Application).filter(userPredicate)

    let item = apps[indexPath.item]
    print(item.name)
    cell.layer.borderColor = UIColor.whiteColor().CGColor
    cell.layer.borderWidth = 5
    cell.itemImage.image = UIImage(data: item.image!)
    cell.itemLabel.text = item.name
    

    return cell
  }

  
  //MARK: Navitation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let cell  = sender as! AppsCollectionViewCell
    let vc    = segue.destinationViewController as! DetailViewController
    vc.apps   = cell.itemLabel.text!
  }
  
}