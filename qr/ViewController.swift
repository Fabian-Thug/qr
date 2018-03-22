//
//  ViewController.swift
//  qr
//
//  Created by Tecinco on 13-03-18.
//  Copyright © 2018 Fabian. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController  {

    var user = "holq"
   
    @IBOutlet weak var nombreLog: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(user)
        self.nombreLog.text = user
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func logout(){
        dismiss(animated: true) {
            _ = SweetAlert().showAlert("Hasta Pronto 👋", subTitle: "Te has deslogueado 🙆‍♂️", style: AlertStyle.success)
        }
    }
    
}

