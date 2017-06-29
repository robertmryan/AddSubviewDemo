//
//  SampleView.swift
//  AddSubviewDemo
//
//  Created by Robert Ryan on 6/29/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ProfileImageContainer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
    }
    
}

class SampleView: UIView {
    
    var container: UIView!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
        
    func configure()  {
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: leftAnchor),
            container.rightAnchor.constraint(equalTo: rightAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        createProfileImageContainers(numberOfFriends: 5)
    }

    var friends = [UIView]()
    
    private func createProfileImageContainers(numberOfFriends: Int) {
        
        // remove old friends in case you called this before
        
        friends.forEach { $0.removeFromSuperview() }
        friends.removeAll()

        // now add friends 
        
        for friend in 0 ..< numberOfFriends {     // easier to go from 0 to numberOfFriends-1 than subtract one later
        
            print(friend)
            
            let imageViewContainer = ProfileImageContainer()
        
            container.addSubview(imageViewContainer)
            
            NSLayoutConstraint.activate([
                imageViewContainer.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.1),
                imageViewContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1),
                NSLayoutConstraint(item: imageViewContainer, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 2 * CGFloat(friend + 1) / CGFloat(numberOfFriends + 1), constant: 0),
                imageViewContainer.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ])
            
            friends.append(imageViewContainer)
        }
        
    } 

}
