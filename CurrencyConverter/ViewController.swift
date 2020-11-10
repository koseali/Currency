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
                    <#code#>
                }
            }
        }
        
    }
}

