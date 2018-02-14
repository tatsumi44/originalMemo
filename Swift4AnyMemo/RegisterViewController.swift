//
//  RegisterViewController.swift
//  Swift4AnyMemo
//
//  Created by tatsumi kentaro on 2018/02/14.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextField: UITextView!
    var mainArray:[[String]] = []
    var contentsArray:[String] = []
    let saveData:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsTextField.layer.borderColor = UIColor.black.cgColor
        contentsTextField.layer.borderWidth = 1.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        contentsArray = [titleTextField.text!,contentsTextField.text!]
        mainArray.append(contentsArray)
        saveData.set(mainArray, forKey: "contents")
    }
    

}
