//  ViewController.swift
//  WhatsAppDirect
//  Created by Ballu on 03/05/22.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var phoneTextView: UITextField!
    
    @IBOutlet var messageTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextView.delegate = self
        //phoneTextView.delegate = self
        phoneTextView.keyboardType = UIKeyboardType.numberPad
        
    }
    
    
    @IBAction func onButtonClick(_ sender: Any) {
        
        let phoneNo = phoneTextView.text ?? ""
        let message = (messageTextView.text ?? "").replacingOccurrences(of: " ", with: "%20")
//        let message = (messageTextView.text ?? "")
//            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        
        let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNo)&text=\(message)")!
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        }
    }
    
}

extension HomeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
