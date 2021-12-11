//
//  FindJob.swift
//  Assignment6
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FindJob: UIViewController {
    
    public  let topLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 29)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Find Job"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    public  let salLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "0"
        return label
    }()
    public  let exLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Expected Salary:"
        return label
    }()
    private let myslider: UISlider = {
       let slider  = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100000
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    @objc func handleSlider() {
        print(myslider.value)
        let sal = Int(myslider.value)
        salLabel.text = String(sal)
    }
    
    private let cityTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter City"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    private let jobTypeTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Job Type"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.layer.borderColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00).cgColor
        return  textField
    }()
    public  let ntLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Notify me when found"
        return label
    }()
    private let mySwitch:UISwitch = {
       let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switcher
    }()
    @objc func handleSwitch() {
        print(mySwitch.isOn)
    }
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func handleClick() {
        let vc = JobHome()
        navigationController?.pushViewController(vc, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.addSubview(topLabel)
        view.addSubview(exLabel)
        view.addSubview(cityTextField)
        view.addSubview(jobTypeTextField)
        view.addSubview(ntLabel)
        view.addSubview(mySwitch)
        view.addSubview(saveButton)
        view.addSubview(salLabel)
        
        view.addSubview(myslider)
        view.addSubview(mySwitch)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        topLabel.frame = CGRect(x: 30, y: 20, width: 300, height: 200)
        exLabel.frame = CGRect(x:20 , y: topLabel.bottom - 70 , width: 200, height: 100)
        salLabel.frame = CGRect(x:190 , y: topLabel.bottom - 70, width: 200, height: 100)
        myslider.frame = CGRect(x: 20, y: topLabel.bottom - 5, width: view.frame.size.width - 40, height: 30)
        cityTextField.frame = CGRect(x: 20, y: myslider.bottom + 20, width: view.width - 40, height: 43)
        jobTypeTextField.frame = CGRect(x: 20, y: cityTextField.bottom + 20, width: view.width - 40, height: 43)
        ntLabel.frame = CGRect(x: 20, y: jobTypeTextField.bottom - 20, width: 300, height: 100)
        mySwitch.frame = CGRect(x: 250, y: jobTypeTextField.bottom + 13, width: 50, height: 30)
        saveButton.frame = CGRect(x: 20, y: mySwitch.bottom + 40 , width: view.width - 40, height: 35)
    }
    


}
