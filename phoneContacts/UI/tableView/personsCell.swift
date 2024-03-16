//
//  personsCell.swift
//  phoneContacts
//
//  Created by Hakan Hardal on 11.03.2024.
//

import UIKit

class personsCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelPhone: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
