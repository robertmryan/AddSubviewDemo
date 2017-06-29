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
    
    var container: UIStackView!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
        
    func configure()  {
        container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .center
        container.distribution = .equalSpacing
        
        addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
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
        
            container.addArrangedSubview(imageViewContainer)  // takes care of x and y coordinates for you; you only need to set width and height
            
            NSLayoutConstraint.activate([
                imageViewContainer.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.1),
                imageViewContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
            ])
            
            friends.append(imageViewContainer)
        }
        
    } 

}
