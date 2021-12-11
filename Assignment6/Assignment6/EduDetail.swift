//
//  EduDetail.swift
//  Assignment6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class EduDetail: UIViewController {
    
    public  let topLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Fillup Your Education Details"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    public  let CourseLabel:UILabel = {
        let label1 = UILabel()
        label1.font = .boldSystemFont(ofSize: 20)
        label1.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label1.text = "Select Course"
        return label1
    }()
    private let pickerView = UIPickerView()
    private let pickerData = ["BCA", "MCA", "B.Tech","M.Tech","BBA","MBA"]
   
    
    
    private let UniversityTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter University Name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .orange
        textField.layer.borderColor = UIColor.black.cgColor
        return  textField
    }()
    
    
    private let PerTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Percentage"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.textColor = .orange
        textField.layer.borderColor = UIColor.black.cgColor
        return  textField
    }()
    
    public  let ExperienceLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Work Experience: "
        return label
    }()
    public  let eLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        return label
    }()
    
    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        stepper.tintColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        return stepper
    }()
    @objc func handleStepper()
    {
        print()
        let q = Int(myStepper.value)
        eLabel.text = String(q)
    }
    
    private let nextButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    
    @objc func handleClick() {
        let vc = PerDetail()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        view.addSubview(topLabel)
        
        view.addSubview(CourseLabel)
        view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self

        view.addSubview(UniversityTextField)
        view.addSubview(PerTextField)
      
        view.addSubview(ExperienceLabel)
        view.addSubview(eLabel)
        view.addSubview(myStepper)
        view.addSubview(nextButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topLabel.frame = CGRect(x: 30, y: 70, width: 300, height: 100)
        CourseLabel.frame = CGRect(x: 20, y: topLabel.bottom + 30, width: 200, height: 20)
        pickerView.frame = CGRect(x : (view.width / 2) - 20 ,y : topLabel.bottom - 10,width : 150,height: 100)
        UniversityTextField.frame = CGRect(x: 20, y: CourseLabel.bottom + 40, width: view.width - 40, height: 43)
        PerTextField.frame = CGRect(x: 20, y: UniversityTextField.bottom + 20, width: view.width - 40, height: 43)
        ExperienceLabel.frame = CGRect(x: 20, y: PerTextField.bottom + 30, width: 200, height: 20)
        eLabel.frame = CGRect(x: 190, y: PerTextField.bottom + 25, width: 100, height: 30)
        myStepper.frame = CGRect(x : 220 , y : PerTextField.bottom + 25, width: 10, height: 100)
        nextButton.frame = CGRect(x: 20, y: myStepper.bottom + 30 , width: view.width - 40, height: 35)
    }
}
extension EduDetail: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1  //number of col
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
}
