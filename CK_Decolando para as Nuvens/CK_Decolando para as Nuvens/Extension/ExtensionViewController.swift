//
//  File.swift
//  CK_Decolando para as Nuvens
//
//  Created by Rebeca Pacheco on 26/11/20.
//

import Foundation
import UIKit



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! ListTableViewCell
        
        tableCell.nameList.text = "aqui fica o nome"
        print(colorChanger)
        switch colorChanger{
        
            case 0:
                tableCell.backgroundColor = UIColor(red: 0.29, green: 0.60, blue: 0.53, alpha: 1.00)
                colorChanger += 1
                
            
            case 1:
                tableCell.backgroundColor = UIColor(red: 0.77, green: 0.27, blue: 0.25, alpha: 1.00)
                colorChanger += 1
                
            case 2:
                tableCell.backgroundColor = UIColor(red: 0.82, green: 0.90, blue: 0.93, alpha: 1.00)
                colorChanger = 0
        default:
            tableCell.backgroundColor = UIColor(red: 0.29, green: 0.60, blue: 0.53, alpha: 1.00)
        }
        
        return tableCell
        
    }
    
    
}
