//
//  Page2.swift
//  Assignment6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Page2: UIViewController {
    private let myProgressView:UIProgressView = {
        let progressview = UIProgressView()
        progressview.isHidden = true
        progressview.setProgress(0.0, animated: true)
        return progressview
    }()
    public  let topLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "SIGNUP"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    
    private let addressTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Address"
        // textView.font = .boldSystemFont(ofSize: 28)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return textView
    }()
    
    public  let dobLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Select DOB "
        return label
    }()
    
    private let mydatePicker:UIDatePicker = {
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        //datepicker.timeZone = timezone(secondsFromGMT: 0)
        datepicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        return datepicker
    }()
    @objc func handleDateChange() {
        print(mydatePicker.date)
    }
    
    private let mobTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Mobile Number"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .orange
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    
    private let submitButton:UIButton = {
        let button = UIButton()
        button.setTitle("SIGNUP", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func handleClick() {
        
        if self.myProgressView.isHidden {
            myProgressView.isHidden = false
            UIView.animate(withDuration: 10.0) {
                self.myProgressView.setProgress(1.0, animated: true)
            }
            
        }
        let vc = JobHome()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 10.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        view.addSubview(topLabel)
        view.addSubview(nameTextField)
        view.addSubview(addressTextView)
        view.addSubview(dobLabel)
        view.addSubview(mydatePicker)
        view.addSubview(mobTextField)
        view.addSubview(submitButton)
        view.addSubview(myProgressView)
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topLabel.frame = CGRect(x: 40, y: 60, width: 300, height: 100)
        nameTextField.frame = CGRect(x: 20, y: topLabel.bottom + 30, width: view.width - 40, height: 43)
        addressTextView.frame = CGRect(x: 20, y: nameTextField.bottom + 20, width: view.width - 40, height: 100)
        dobLabel.frame = CGRect(x: 20, y: addressTextView.bottom + 25, width: 200, height: 20)
        mydatePicker.frame = CGRect(x: 20, y: dobLabel.bottom , width: 345, height: 50)
        mobTextField.frame = CGRect(x: 20, y: mydatePicker.bottom + 10, width: view.width - 40, height: 43)
        submitButton.frame = CGRect(x: 20, y: mobTextField.bottom + 40 , width: view.width - 40, height: 35)
        
       myProgressView.frame=CGRect(x:20,y:submitButton.bottom + 20,width:view.width - 40,height: 50)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
}
}


