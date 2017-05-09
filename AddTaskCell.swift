//
//  AddTaskCell.swift
//  TrackList_2
//
//  Created by trioxis on 8/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class AddTaskCell: BaseCell {
    
    let taskTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Task name:"
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        return titleLabel
    }()
    
    let nameInputField: UITextField = {
        let inputField = UITextField()
        //inputField.placeholder = "Task"
        inputField.borderStyle = UITextBorderStyle.roundedRect
        inputField.autocorrectionType = UITextAutocorrectionType.no
        inputField.keyboardType = UIKeyboardType.default
        inputField.returnKeyType = UIReturnKeyType.done
        inputField.clearButtonMode = UITextFieldViewMode.whileEditing
        inputField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        inputField.delegate = self as? UITextFieldDelegate
        return inputField
    }()
    
    let addTaskButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(AddTaskCell.handleAddTask), for: UIControlEvents.touchUpInside)
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAddTask)))
        return button
    }()
    
    func handleAddTask(){
        print("Adding task...")
    }
    
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(taskTitleLabel)
        addSubview(nameInputField)
        addSubview(addTaskButton)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: taskTitleLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: nameInputField)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addTaskButton)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(25)]-16-[v2]", views: taskTitleLabel, nameInputField, addTaskButton)
    
    }
}
