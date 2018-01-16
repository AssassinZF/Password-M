//
//  LoginViewController.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func switchRootVc(rootvc:UIViewController) {
        
    }
    
    //IBOut
    @IBAction func clickLogin(_ sender: UIButton) {
        guard let u = self.userNameTF.text else {return}
        guard let p = self.passwordTF.text else {return}
        BmobUser.loginWithUsername(inBackground: u, password: p) { (user, error) in
            if let err = error{
               print("\(err)")
            }else{
                let apl = AppDelegate()
                let root = MainViewController()
                apl.switchRootVc(rootVc: root)
            }
        }
    }
    
    @IBAction func clickRegister(_ sender: UIButton) {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
