//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ali Köse on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
     
    }


    @IBAction func getRates(_ sender: Any) {
        
        // 1-) Reqest & session
        // 2-) Response & Data
        // 3-)  Parsin & Json serialization
        // URLSession.shared.datatask ile de direk alınabilir ama ayrı
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=80eb126d00e9b7bc8773b90a6a54f6f3")
        let session = URLSession.shared
        // closure
        let task = session.dataTask(with: url!) { (data, respons, error) in
            if error != nil{
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            }
            
            // 2. step
            else{
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                let  tele = rates["TRY"] as! Double
                                print(tele)
                                if let tryn = rates["TRY"] as? Double{
                                    let tryn = tryn / tele
                                    self.tryLabel.text =  "TRY: \(tryn)"
                                }
                                
                                if var cad = rates["CAD"] as? Double{
                                    cad = tele / cad
                                    self.cadLabel.text =  "CAD: \(cad)"
                                    //"CAD: " + String(cad)
                                
                                }
                                if var chf = rates["CHF"] as? Double{
                                    chf = tele / chf
                                    self.chfLabel.text =  "CHF: \(chf)"
                                }
                                if var gbp = rates["GBP"] as? Double{
                                    gbp = tele / gbp
                                    self.gbpLabel.text =  "GBP: \(gbp)"
                                }
                                if var jpy = rates["JPY"] as? Double{
                                    jpy = tele / jpy
                                    self.jpyLabel.text =  "JPY: \(jpy)"
                                }
                                if var usd = rates["USD"]  as? Double{
                                     usd = tele / usd
                                    self.usdLabel.text =  "USD: \(usd)"
                                    
                                }
                                if let euro = rates["TRY"]  as? Double{
                                    self.euroLabel.text =  "EUR: \(euro)"
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                    } catch {print("error")}
                }
            }
            
        }
        task.resume()
        
        // start to task for all things task.resume() // start to task for all things
    }
    
}

