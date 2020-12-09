//
//  LetterViewController.swift
//  CK_Decolando para as Nuvens
//
//  Created by Rebeca Pacheco on 26/11/20.
//

import UIKit


class LetterViewController: UIViewController {
    
    
    
    @IBOutlet weak var letterText: UITextView!
    
    @IBOutlet weak var signature: UITextField!
    
    @IBOutlet weak var ButtonLetter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signature.layer.borderColor = UIColor(red: 0.76, green: 0.27, blue: 0.25, alpha: 1.00).cgColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @IBAction func onTouchSend(_ sender: Any) {
        let letter = Letter(name: signature.text!, content: letterText.text!)
        letter.createRecord(){
            error in
            if error != nil{
                print("Error in CloudKit:", error as Any)
            }
        }
    
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
