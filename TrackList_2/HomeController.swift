//
//  HomeController.swift
//  TrackList_2
//
//  Created by trioxis on 2/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var tasks: [Task] = {
        var taskOne = Task()
        taskOne.name = "Finish TrackList"
        taskOne.deadline = "Today"
        taskOne.important = true
        
        var taskTwo = Task()
        taskTwo.name = "Go Home"
        taskTwo.deadline = "Tonight"
        taskTwo.important = false
        
        var taskThree = Task()
        taskThree.name = "Helpdesk"
        taskThree.deadline = "Tomorrow"
        taskThree.important = true
        
        return [taskOne, taskTwo, taskThree]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
    
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  TrackList"
        titleLabel.font = UIFont(name: "DINPro", size: 20)
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setUpMenuBar()
        setUpNavBarButtons()

    }
    
    private func setUpNavBarButtons() {
        let addTask = UIImage(named: "addTask")?.withRenderingMode(.alwaysOriginal)
        let addTaskButtonItem = UIBarButtonItem(image: addTask, style: .plain, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItems = [addTaskButtonItem]
    }
    
    let addTaskLauncher = AddTaskLauncher()
    
    func handleAdd(){
        addTaskLauncher.showAddTask()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        
        return mb
    }()
    
    private func setUpMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let menuView =  UIView()
        menuView.backgroundColor = UIColor.rgb(red: 101, green: 101, blue: 242)
        view.addSubview(menuView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true

    }
    
    // Number of rendered cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Create cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TaskCell
        cell.task = tasks[indexPath.item]
        

        return cell
    }
    
    // Size of each task cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    // Remove unwanted spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
