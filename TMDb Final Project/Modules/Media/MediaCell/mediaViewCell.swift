//
//  mediaViewCell.swift
//  TMDb Final Project
//
//  Created by Illia Marchenko on 25.08.2022.
//

import UIKit

class mediaViewCell: UITableViewCell {

    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure (with moviesTrending: Results){
        self.test1.text = moviesTrending.title
        self.test2.text = moviesTrending.releaseDate
        
    }
}
