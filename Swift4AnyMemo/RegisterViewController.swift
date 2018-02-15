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
        //更新編集の場合
        if saveData.object(forKey: "contents") != nil{
            mainArray = saveData.object(forKey: "contents") as! [[String]]
        }
        //新規保存か更新編集かを判定
        if cellOfNum != nil{
            titleTextField.text = mainArray[cellOfNum][0]
            contentsTextField.text = mainArray[cellOfNum][1]
            mainArray.remove(at: cellOfNum)
        }else{
            titleTextField.text = ""
            contentsTextField.text = ""
        }
        //textViewに枠線をつける
        contentsTextField.layer.borderColor = UIColor.black.cgColor
        contentsTextField.layer.borderWidth = 1.0
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //保存ボタン
    @IBAction func saveButton(_ sender: Any) {
        contentsArray = [titleTextField.text!,contentsTextField.text!]
        //新規保存か更新編集かを判定
        if cellOfNum != nil{
            mainArray.insert(contentsArray, at: cellOfNum)
            cellOfNum = nil
            print("A")
        }else{
            mainArray.append(contentsArray)
            print("B")
        }
        saveData.set(mainArray, forKey: "contents")
        //保存を押した時のアラート
        let alert:UIAlertController = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("保存したよ")
        }))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
}
