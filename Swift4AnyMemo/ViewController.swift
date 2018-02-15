//
//  ViewController.swift
//  Swift4AnyMemo
//
//  Created by tatsumi kentaro on 2018/02/14.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let saveData:UserDefaults = UserDefaults.standard
    var mainArray:[[String]]!
    var cellOfNum: Int!
    
    
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if mainArray != nil{
             return mainArray.count
        }else{
           return 10
        }
        
    }
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if mainArray != nil{
            
            cell?.textLabel?.text = mainArray[indexPath.row][0]
            //            print(mainArray = saveData.object(forKey: "contents") as! [[String]]!)
        }else{
            print("何もないよ")
        }
        return cell!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    //画面遷移するたびに呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //データあるかの判定
        if saveData.object(forKey: "contents") as! [[String]]! != nil{
            mainArray = saveData.object(forKey: "contents") as! [[String]]!
            tableView.reloadData()//ハマりポイント更新している
            
            print("呼ばれているよ")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //セルを選択時呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        cellOfNum = indexPath.row
        performSegue(withIdentifier: "Register", sender: nil)
        
    }
    //画面遷移時に値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Register"{
            let registerViewContoroller = segue.destination as! RegisterViewController
            registerViewContoroller.cellOfNum = self.cellOfNum
            print(self.cellOfNum)
        }
    }
    //追加ボタン押した時
    @IBAction func addClick(_ sender: Any) {
        performSegue(withIdentifier: "Register", sender: nil)
    }
    //スワイプ削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            mainArray.remove(at: indexPath.row)
            saveData.set(mainArray, forKey: "contents")
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("削除した")
            
        }
    }
    
    
    
}

