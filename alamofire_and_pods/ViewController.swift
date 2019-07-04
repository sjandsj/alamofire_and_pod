//
//  ViewController.swift
//  alamofire_and_pods
//
//  Created by mac on 03/07/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    //var throughmodels = model?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            if let json = response.result.value {
                print("JSON: \(json)")
            
                guard let jsonArray = json as? [String: Any] else {return}
                let bpiDict = jsonArray["bpi"]!
                let usdDict = bpiDict as? [String: Any]
                //print("usd dict:\(usdDict)")
                let innerbpiDict = usdDict!["USD"] as? [String: Any]
                print("usd dictionary : \(innerbpiDict!)")
                
//                for (key, value) in (innerbpiDict)! {
//                    self.throughmodels.append(model(someKey: key, someValue: value as! String))
//                }
//                print("key value pair \(self.throughmodels)")
//                 let dataModel: model =
//                for i in 0...(self.throughmodels.count-1) {
//                    
//                }
               
               self.priceLabel.text = "$ \(innerbpiDict!["rate"]! as! String)"
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

