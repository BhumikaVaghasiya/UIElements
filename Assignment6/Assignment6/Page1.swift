//
//  Page1.swift
//  Assignment6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Page1: UIViewController {
    
    public  let jname:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 47)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "JOB SEARCH"
        return label
    }()
    
    public  let Rname:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "SIGNIN"
        return label
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    
    private let pwdTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("SIGNIN", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc func handleClick() {
        let vc = JobHome()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    public  let sname:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Register here"
        return label
    }()
    private let sButton:UIButton = {
        let button = UIButton()
        button.setTitle("Signup", for: .normal)
        button.addTarget(self, action: #selector(handleClick1), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.13, green: 0.09, blue: 0.06, alpha: 1.00)
        button.layer.cornerRadius = 10
        return button
    }()
    @objc func handleClick1() {
        let vc = Page2()
        navigationController?.pushViewController(vc, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
         self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        //self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "mbg")!)
          view.addSubview(jname)
        view.addSubview(Rname)
        view.addSubview(nameTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
        view.addSubview(sname)
        view.addSubview(sButton)
      
        
    }
    override func viewDidLayoutSubviews() {
        jname.frame = CGRect(x: 40, y: 20, width: 400, height: 200)
        Rname.frame = CGRect(x: 130, y: 250, width: 300, height: 43)
        nameTextField.frame = CGRect(x: 40, y: 330, width: view.width - 80, height: 43)
        pwdTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 43)
        loginButton.frame = CGRect(x: 40, y: pwdTextField.bottom + 30, width: view.width - 80, height: 43)
        sname.frame = CGRect(x:105, y: loginButton.bottom + 10, width: 200, height: 100)
        sButton.frame = CGRect(x: 210, y: loginButton.bottom + 45, width: 90, height: 26)
    }
}


