//
//  MyProfile.swift
//  Assignment6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class MyProfile: UIViewController {

    private let myImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
//        imageview.backgroundColor = .black
//        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius =  10
        imageview.image = UIImage(named: "mp.jpg")
        return imageview
    }()
    private let imagePicker: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
    private let picButton:UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func handleClick() {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    public  let nmLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Bhumika Vaghasiya "
        return label
    }()
    public  let txtLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 0.17, green: 0.12, blue: 0.08, alpha: 1.00)
        label.text = "Software Developer"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:  UIImage(named: "jbg")!)
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.addSubview(myImageView)
        view.addSubview(picButton)
        imagePicker.delegate = self
        view.addSubview(nmLabel)
        view.addSubview(txtLabel)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame=CGRect(x:40,y:70,width: 300,height: 300)
        picButton.frame = CGRect(x: 140, y: myImageView.bottom + 10, width: 100, height: 40)
        
        nmLabel.frame = CGRect(x: 60, y: picButton.bottom + 10, width: 400, height: 50)
        txtLabel.frame = CGRect(x: 120, y: nmLabel.bottom - 10 , width: 200, height: 50)
        
    }
    


}
extension MyProfile: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
            
        }
        picker.dismiss(animated: true)
    }
}
