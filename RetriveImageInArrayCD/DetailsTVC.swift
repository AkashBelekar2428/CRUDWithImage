//
//  DetailsTVC.swift
//  RetriveImageInArrayCD
//
//  Created by Akash Belekar on 17/04/23.
//

import UIKit

class DetailsTVC: UITableViewCell {
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var nameLbl:UILabel!
//
//    var profileDetails:Profile?{
//        img.image = UIImage(data: (profileDetails?.image)!)
//        nameLbl.text = profileDetails?.name
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
