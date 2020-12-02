//
//  ListTableViewCell.swift
//  CK_Decolando para as Nuvens
//
//  Created by Rebeca Pacheco on 26/11/20.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameList: UILabel!
    
    @IBOutlet weak var detailsList: UILabel!
    
    @IBOutlet weak var imageList: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
