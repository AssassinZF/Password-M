//
//  InfoViewController.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import UIKit

enum ShowType {
    case addNew
    case showOld
}

class InfoViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTF: UITextField!
    
    var showType:ShowType = .addNew
    var item:PasswordModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = self.item {
            showType = .showOld
            self.userNameTF.text = item.userName
            self.passwordTF.text = item.passWord
            self.titleTF.text = item.title
            self.saveButton.setTitle("Update", for: .normal)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSave(_ sender: Any) {
        guard let u = self.userNameTF.text else {return}
        guard let p = self.passwordTF.text else {return}
        guard let t = self.titleTF.text else {return}
        let gamescore:BmobObject = BmobObject(className: "PasswordTab")
        gamescore.setObject(u, forKey: "userName")
        gamescore.setObject(p, forKey: "password")
        gamescore.setObject(t, forKey: "title")
        gamescore.saveInBackground { (isSuc, error) in
            if let err = error{
                print("error is \(err)")
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
