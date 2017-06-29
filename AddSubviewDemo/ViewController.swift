//
//  ViewController.swift
//  AddSubviewDemo
//
//  Created by Robert Ryan on 6/29/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let friendsViewController = childViewControllers.first as? FriendCollectionViewController else {
            fatalError("no friends view controller")
        }
        
        friendsViewController.friendDelegate = self
        friendsViewController.friends = Array(1 ... 100).map { Friend(name: "\($0)") }
    }

}

extension ViewController: FriendCollectionViewControllerDelegate {
    func friendCollectionView(_ friendCollectionView: FriendCollectionViewController, didSelectItemAt indexPath: IndexPath, friend: Friend) {
        print("selected \(friend)")
    }
}

