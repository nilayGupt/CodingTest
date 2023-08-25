//
//  UsersTableViewCell.swift
//  CodingTestApp
//
//  Created by Nilay on 25/08/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell,Reusable {
    @IBOutlet weak var userNameLabel : UILabel!
    @IBOutlet weak var userEmailLabel : UILabel!
    @IBOutlet weak var userImageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
