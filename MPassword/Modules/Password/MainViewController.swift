//
//  MainViewController.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import UIKit
import SnapKit

let ROWHEIGHT:CGFloat = 60.0
let TAB_NAME = "PasswordTab"


class MainViewController: UIViewController {

    lazy var tableView:UITableView = {
        let tab = UITableView(frame: CGRect.zero, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.rowHeight = ROWHEIGHT
        tab.delegate = self
        tab.dataSource = self
        tab.tableFooterView = UIView()
        tab.register(UINib.init(nibName: MainTableViewCell.identifierID(), bundle: nil) , forCellReuseIdentifier: MainTableViewCell.identifierID())
        return tab
    }()
    
    lazy var dataList:[PasswordModel] = {
        let array = [PasswordModel]()
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MPassword"
        initUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        queryAllListData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI() {
        self.view.addSubview(self.tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        let leftItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickAddData))
        self.navigationItem.rightBarButtonItem = leftItem
    }
    
    func queryAllListData() {
        let query:BmobQuery = BmobQuery(className: TAB_NAME)
        query.findObjectsInBackground { (list, error) in
            if let array = list {
                self.dataList.removeAll()
                for i in 0..<array.count{
                    let obj = array[i] as! BmobObject
                    let userName:String = obj.object(forKey: "userName") as! String
                    let password:String = obj.object(forKey: "password") as! String
                    let title:String = obj.object(forKey: "title") as! String
                    let item = PasswordModel()
                    item.userName = userName
                    item.passWord = password
                    item.title = title
                    self.dataList.append(item)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func clickAddData() {
        self.navigationController?.pushViewController(InfoViewController(), animated: true)
    }

}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifierID()) as! MainTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let item = self.dataList[indexPath.row]
        cell.useNameLB.text = item.userName
        cell.descLB.text = "- \(item.title!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.dataList[indexPath.row]
        let vc = InfoViewController(nibName: "InfoViewController", bundle: nil)
        vc.item = item
        self.navigationController?.pushViewController(vc, animated: true)



    }
}
