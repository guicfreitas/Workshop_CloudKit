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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! ListTableViewCell
        
        tableCell.nameList.text = "aqui fica o nome"
        
        return tableCell
        
    }
    
    
}
