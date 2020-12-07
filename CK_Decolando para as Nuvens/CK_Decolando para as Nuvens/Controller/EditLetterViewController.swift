//
//  EditLetterViewController.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 04/12/20.
//

import UIKit

class EditLetterViewController: UIViewController {
    var letter: Letter!
    var delegate: EditLetterViewControllerDelegate!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentText.text = letter.content
        nameLabel.text = letter.name
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func onTouchUpdate(_ sender: Any) {
        contentText.isEditable = false
        
        if let newName = nameLabel.text,
           let newContent = contentText.text{
            
            letter.updateRecordWithId(name: newName, content: newContent){
                error in
                if error != nil {
                    print("Error in CloudKit update")
                }else{
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                        self.delegate.updateInModalViewController(sender: self)
                        
                    }
                }
            }
        }
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
