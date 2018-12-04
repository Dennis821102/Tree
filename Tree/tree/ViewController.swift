//
//  ViewController.swift
//  Tree
//
//  Created by 周袁德 on 2018/11/12.
//  Copyright © 2018年 周袁德. All rights reserved.
//

import UIKit
struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    var opened2 = Bool()
    var sectionData2 = [String]()
    
}
//struct cellData2 {
//    var opened2 = Bool()
//    var title2 = [String]()
//    var sectionData2 = [String]()
//
//}
//struct cellData3 {
//    var opened3 = Bool()
//        var title2 = [String]()
//    var sectionData3 = [String]()
//
//}

class TableViewController: UITableViewController,XMLParserDelegate {

    var tableViewData = [cellData]()
//    var tableViewData2 = [cellData2]()
//    var tableViewData3 = [cellData3]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableViewData = [cellData(opened: false, title: "000",sectionData: ["section"],opened2: true,sectionData2: ["section2"])]
//        tableViewData2 = [cellData2(opened2: false, sectionData2: ["1111"])]
//        tableViewData3 = [cellData3(opened3: false, sectionData3: ["1112"])]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        if tableViewData.count == 0{
        return tableViewData.count
        }else{
            return tableViewData.count
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
            
        }else{
            tableViewData[section].opened2 = true
                return tableViewData[section].sectionData2.count + 1
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
                
                return UITableViewCell()
                
            }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") else{
                return UITableViewCell()
            }
            if tableViewData[indexPath.section].opened == false {
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
            
            }else{
                guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell22") else{
                    return UITableViewCell()
                }
            cell2.textLabel?.text = tableViewData[indexPath.section].sectionData2[indexPath.row - 1]
                return cell2
            }
        }
    }
//   這邊為收縮代碼
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)

            tableViewData[indexPath.section].opened2 = false
            let section2 = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section2, with: .none)
            
        }else{
            tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
            
            if tableViewData[indexPath.section].opened2 == false {
                tableViewData[indexPath.section].opened2 = true
                let section2 = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section2, with: .none)
            }else{
            tableViewData[indexPath.section].opened2 = false
            let section2 = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section2, with: .none)
        }
        }
    }
}

