//
//  JobHome.swift
//  Assignment6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class JobHome: UIViewController {
    
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
       
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let item = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handlefind))
        let item2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleprofile))
        toolBar.items = [space, item, item2]
        return toolBar
    }()
    @objc private func handlefind() {
        print("find called")
        let vc = FindJob()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func handleprofile() {
        print("profile called")
        let vc = MyProfile()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    public  let topLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Most Popular Job"
        return label
    }()
    
    private let mysegmentControl:UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Android Developer", at: 0, animated: true)
        segment.insertSegment(withTitle: "ios Developer", at: 1, animated: true)
        segment.insertSegment(withTitle: "Network Engineer", at: 2, animated: true)
       
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(handleSegmentControl), for: .valueChanged)
        segment.tintColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        
        return segment
    }()
    @objc func handleSegmentControl() {
        // print(mysegmentControl.selectedSegmentIndex)
        
        
    }
    
    private let myView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.87, green: 0.78, blue: 0.73, alpha: 1.00)
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        view.layer.cornerRadius = 20
        return view
    }()
    public  let jobLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.13, green: 0.09, blue: 0.06, alpha: 1.00)
        label.text = "UI/UX DESIGNER\nlooking foe an user interface designer with 4+ years of industry experience.\nSalary=30k To 70k\nAddress : city light road,surat."
        label.numberOfLines = 20
        return label
    }()
    private let acButton:UIButton = {
        let button = UIButton()
        button.setTitle("APPLY NOW", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.13, green: 0.09, blue: 0.06, alpha: 1.00)
        button.layer.cornerRadius = 6
        return button
    }()
    @objc func handleClick(){
        let vc = EduDetail()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        tabBar.items = [item1,item2]
        
        return tabBar
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        view.addSubview(toolBar)
        view.addSubview(topLabel)
        view.addSubview(mysegmentControl)
        
        view.addSubview(myView)
        myView.addSubview(jobLabel)
        myView.addSubview(acButton)
        
        view.addSubview(tabBar)
        tabBar.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40.0
        toolBar.frame=CGRect(x:0, y:0, width:view.frame.size.width, height: toolBarHeight)
        topLabel.frame = CGRect(x: 10, y: 50, width: 200, height: 50)
        mysegmentControl.frame = CGRect(x: 0, y: topLabel.bottom - 10, width: view.frame.size.width, height: 40)
        myView.frame = CGRect(x: 5, y: mysegmentControl.bottom + 20, width: view.width - 10, height: 150)
        jobLabel.frame = CGRect(x: 15, y: mysegmentControl.bottom - 150, width: myView.width, height: myView.height)
        acButton.frame = CGRect(x: myView.width / 2, y: jobLabel.bottom - 20, width: 150, height: 30)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49.0
        tabBar.frame=CGRect(x:0, y:view.frame.size.height - tabBarHeight, width:view.frame.size.width, height: tabBarHeight)
        navigationController?.setNavigationBarHidden(true, animated: false)
      
    }
    
}
extension JobHome: UITabBarDelegate {
    
    func tabBar(_tabBar: UITabBar, didSelect item:UITabBarItem){
        print(item.tag)
        
    }
    
}

