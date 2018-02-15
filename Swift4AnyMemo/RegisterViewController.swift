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
    var cellOfNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.object(forKey: "contents") != nil{
            mainArray = saveData.object(forKey: "contents") as! [[String]]
        }
        if cellOfNum != nil{
            titleTextField.text = mainArray[cellOfNum][0]
            contentsTextField.text = mainArray[cellOfNum][1]
            mainArray.remove(at: cellOfNum)
        }else{
            titleTextField.text = ""
            contentsTextField.text = ""
        }
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
        if cellOfNum != nil{
            mainArray.insert(contentsArray, at: cellOfNum)
            cellOfNum = nil
            print("A")
        }else{
            mainArray.append(contentsArray)
            print("B")
        }
        saveData.set(mainArray, forKey: "contents")
        //        print(saveData.object(forKey: "contents") as! [[String]]!)
        
        
    }
    
    
    
}
