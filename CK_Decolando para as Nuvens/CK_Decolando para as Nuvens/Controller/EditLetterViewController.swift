//
//  EditLetterViewController.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 04/12/20.
//

import UIKit

class EditLetterViewController: UIViewController {
    var letter: Letter!
    @IBOutlet weak var contentText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentText.text = letter.content
        // Do any additional setup after loading the view.
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
