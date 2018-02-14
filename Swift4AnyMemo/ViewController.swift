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
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainArray.count == nil{
            return 10
        }else{
             return mainArray.count
        }
       
    }
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = mainArray[indexPath.row][1]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        mainArray = saveData.object(forKey: "contents") as! [[String]]!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    @IBAction func addClick(_ sender: Any) {
        performSegue(withIdentifier: "Register", sender: nil)
    }
    

}

