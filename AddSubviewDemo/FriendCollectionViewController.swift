//
//  FriendCollectionViewController.swift
//  AddSubviewDemo
//
//  Created by Robert Ryan on 6/29/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FriendCell"

// define a protocol by which we can inform the parent view controller that a friend was selected

protocol FriendCollectionViewControllerDelegate: class {
    func friendCollectionView(_ friendCollectionView: FriendCollectionViewController, didSelectItemAt indexPath: IndexPath, friend: Friend)
}

class FriendCollectionViewController: UICollectionViewController {

    var friends: [Friend]? { didSet { collectionView?.reloadData() } }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCell
    
        let friend = friends![indexPath.row]
        
        cell.label.text = friend.name
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let the parent view controller know that a friend was selected, but only if it conforms
        // to our protocol
        
        if let parent = parent as? FriendCollectionViewControllerDelegate {
            parent.friendCollectionView(self, didSelectItemAt: indexPath, friend: friends![indexPath.row])
        }
    }
    
}
