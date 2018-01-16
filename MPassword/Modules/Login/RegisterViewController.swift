//
//  RegisterViewController.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func clickStartRegister(_ sender: Any) {
        guard let u = self.userNameTF.text else {return}
        guard let p = self.passwordTF.text else {return}
        let user = BmobUser()
        user.username = u
        user.password = p
        user.signUpInBackground { (isSuc, error) in
            if isSuc {
                print("Sign up successfully")
                self.navigationController?.popViewController(animated: true)
            }else{
                print("Sign up error\(error!)")
            }
        }
    }
    
}
