//
//  SampleView.swift
//  AddSubviewDemo
//
//  Created by Robert Ryan on 6/29/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class profileImageContainer: UIView {
    
    let imageViewContainer: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor.blue
        
        return iv
    }()
    
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
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: leftAnchor),
            container.rightAnchor.constraint(equalTo: rightAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func createProfileImageContainers(numberOfFriends: Int) {
        
        for friends in 1...numberOfFriends {
            
            print(friends)
            
            let imageViewContainer = profileImageContainer()
            
            addSubview(imageViewContainer)
            
            NSLayoutConstraint(item: imageViewContainer, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 0.1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageViewContainer, attribute: .height, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 0.1, constant: 0).isActive = true
            
            NSLayoutConstraint(item: imageViewContainer, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 0.5 + (CGFloat(friends - 1) / 50.0), constant: 0).isActive = true
            
            
            NSLayoutConstraint(item: imageViewContainer, attribute: .centerY, relatedBy: .equal, toItem: container, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        }
        
    } 

}
