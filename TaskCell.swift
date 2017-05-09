//
//  TaskCell.swift
//  TrackList_2
//
//  Created by trioxis on 3/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class TaskCell: BaseCell {
    
    var task: Task? {
        didSet {
            taskNameLabel.text = task?.name
        }
    }
    
    let taskNameLabel: UILabel = {
        let textLabel = UILabel()
        //textLabel.text = "Finish TrackList"
        textLabel.font = UIFont(name: "DINPro", size: 15)
        textLabel.font = UIFont.boldSystemFont(ofSize: 15)
        //        textLabel.backgroundColor = UIColor.red
        textLabel.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        return textLabel
    }()
    
    
    let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return separatorView
    }()
    
    override func setUpViews(){
        addSubview(taskNameLabel)
        addSubview(separatorView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: taskNameLabel)
        addConstraintsWithFormat(format: "V:|[v0]-1-[v1(0.3)]|", views: taskNameLabel, separatorView)
        //addConstraintsWithFormat(format: "V:[v0(0.3)]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal, toItem: taskNameLabel, attribute: .bottom, multiplier: 1, constant: 1))
        
    }
    
}



