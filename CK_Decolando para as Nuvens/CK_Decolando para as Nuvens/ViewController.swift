//
//  ViewController.swift
//  CK_Decolando para as Nuvens
//
//  Created by João Guilherme on 24/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}


