//
//  xmldata.swift
//  Tree
//
//  Created by 周袁德 on 2018/11/12.
//  Copyright © 2018年 周袁德. All rights reserved.
//

import UIKit

class xmldata: NSObject,XMLParserDelegate {
    
    func XMLdata(str: String) -> String{
    var strret = ""
    let username = "admin"
    let password = "admin"
    let loginString = String(format: "%@:%@", username, password)
    let loginData = loginString.data(using: String.Encoding.utf8)!
    let base64LoginString = loginData.base64EncodedString()
    let urlString: String = "http://122.117.153.225:8089/station?guid=station-android-c11daedfe6e615f9;"
    let url = URL(string:urlString)
    //?建?求?象
    var request = URLRequest(url: url!)
    //request.httpMethod = "POST"
    request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    
    let session = URLSession.shared
    
    let semaphore = DispatchSemaphore(value: 0)
    
    let dataTask = session.dataTask(with: request,
                                    completionHandler: {(data, response, error) -> Void in
                                        if error != nil{
                                            print(error!)
                                            
                                        }else{
                                            let str = String(data: data!, encoding: String.Encoding.utf8)
                                            print(str!)
                                            
                                        }
                                        
                                        semaphore.signal()
    }) as URLSessionTask
    
    //使用resume方法??任?
    dataTask.resume()
    //print(dataTask)
    _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    print("?据加?完?！")
    //???行其他代?.......
        
        return str
}
}
