//
//  ViewController.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 24/11/20.
//

import UIKit

class ViewController: UIViewController {
    var letters: [Letter] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    var colorChanger = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print(self.letters)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let letter = Letter(name: "", content: "")
        letter.readRecord(){
            
            fetchedRecords,error in
            
            guard let records = fetchedRecords,error == nil else{
                print("Error in read CloudKit", error as Any)
                return
            }
            
            self.letters = records
            
        }
    }
    
    
    
}


