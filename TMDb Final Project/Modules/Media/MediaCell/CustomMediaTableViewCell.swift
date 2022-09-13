//
//  CustomMediaTableViewCell.swift
//  TMDb Final Project
//
//  Created by Illia Marchenko on 24.08.2022.
//

import UIKit

class CustomMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var cellMediaTitle: UILabel!
    @IBOutlet weak var cellMediaReleaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    
//    }

    func configure (with moviesTrending: Results){
//        self.cellMediaTitle.text = moviesTrending.title
//        self.cellMediaReleaseDate.text = moviesTrending.releaseDate
        self.cellMediaTitle.text = moviesTrending.title
        self.cellMediaReleaseDate.text = moviesTrending.releaseDate
        
    }
}
