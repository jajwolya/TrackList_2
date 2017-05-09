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
        titleLabel.font = titleLabel.font.withSize(12)
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
    
    let taskDeadlineLabel: UILabel = {
        let deadlineLabel = UILabel()
        deadlineLabel.text = "Deadline:"
        deadlineLabel.font = deadlineLabel.font.withSize(12)
        return deadlineLabel
    }()
    
    let deadlineInputField: UITextField = {
        let inputField = UITextField()
        //inputField.placeholder = "Deadline"
        inputField.borderStyle = UITextBorderStyle.roundedRect
        inputField.autocorrectionType = UITextAutocorrectionType.no
        inputField.keyboardType = UIKeyboardType.default
        inputField.returnKeyType = UIReturnKeyType.done
        inputField.clearButtonMode = UITextFieldViewMode.whileEditing
        inputField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        inputField.delegate = self as? UITextFieldDelegate
        return inputField
        
    }()
    
    let importantBoolView: UISwitch = {
        let importantField = UISwitch()
        if(importantField.isOn){
            importantField.setOn(true, animated: true)//But it will already do it.
        }
        else{
            importantField.setOn(false, animated: true)
        }
        //importantField.setOn(false, animated: false)
        importantField.onTintColor = UIColor.rgb(red: 101, green: 101, blue: 242)
        importantField.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)
        return importantField
    }()
    
    func switchChanged(sender: UISwitch!) {
        print("Switch value is \(sender.isOn)")
    }
    
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(taskTitleLabel)
        addSubview(nameInputField)
        addSubview(taskDeadlineLabel)
        addSubview(deadlineInputField)
        addSubview(importantBoolView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]", views: taskTitleLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: nameInputField)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(25)]-16-[v2]-8-[v3(25)]-16-[v4]", views: taskTitleLabel, nameInputField, taskDeadlineLabel, deadlineInputField, importantBoolView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]", views: taskDeadlineLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: deadlineInputField)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]", views: importantBoolView)
    
    }
}
