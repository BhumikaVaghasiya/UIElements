//
//  PerDetail.swift
//  Assignment6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class PerDetail: UIViewController {
    
    public  let topLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Fillup Your Personal Details"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Full Name"
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
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        activity.hidesWhenStopped = true
        return activity
    }()
    
    private let submitButton:UIButton = {
        let button = UIButton()
        button.setTitle("SUBMIT", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func handleClick() {
        print(myActivityIndicatorView.isAnimating)
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
            if !self.myActivityIndicatorView.isHidden {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                    self.myActivityIndicatorView.stopAnimating()
                    self.myActivityIndicatorView.isHidden = true
                    let vc = JobHome()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
         
        view.addSubview(myActivityIndicatorView)
        view.addSubview(topLabel)
        view.addSubview(nameTextField)
        view.addSubview(addressTextView)
        view.addSubview(dobLabel)
        view.addSubview(mydatePicker)
        view.addSubview(mobTextField)
        view.addSubview(submitButton)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        topLabel.frame = CGRect(x: 30, y: 70, width: 300, height: 100)
        nameTextField.frame = CGRect(x: 20, y: topLabel.bottom + 40, width: view.width - 40, height: 43)
        addressTextView.frame = CGRect(x: 20, y: nameTextField.bottom + 20, width: view.width - 40, height: 100)
        dobLabel.frame = CGRect(x: 20, y: addressTextView.bottom + 25, width: 200, height: 20)
        mydatePicker.frame = CGRect(x: 20, y: dobLabel.bottom , width: 350, height: 50)
        mobTextField.frame = CGRect(x: 20, y: mydatePicker.bottom + 10, width: view.width - 40, height: 43)
        submitButton.frame = CGRect(x: 20, y: mobTextField.bottom + 40 , width: view.width - 40, height: 35)
        
        myActivityIndicatorView.frame = CGRect(x: 145, y: submitButton.bottom - 20 , width: 100, height: 100)
    }


}
