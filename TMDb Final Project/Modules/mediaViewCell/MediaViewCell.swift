import UIKit
import SDWebImage


class MediaViewCell: UITableViewCell {
    @IBOutlet weak private var titleMediaLabel: UILabel!
    @IBOutlet weak private var generesMediaCellLabel: UILabel!
    @IBOutlet weak private var raitingMediaViewCellLabel: UILabel!
    @IBOutlet weak private var cellTextView: UIView!
    @IBOutlet weak private var BackdropImageView: UIImageView!
    @IBOutlet weak private var backdropView: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//MARK: - configure func
    func configure (with moviesTrending: Results){
        self.titleMediaLabel.text = moviesTrending.title ?? moviesTrending.name
        self.raitingMediaViewCellLabel.text="\( moviesTrending.voteAverage?.roundToDecimal(1) ?? 0) "
        setBackdropPathImage(imgPath: moviesTrending.backdropPath)
        generesMediaCellLabel.text =  setGenreLis(genreIds:moviesTrending.genreIDS)
    }
    
     func configure (with savedMediaList: WathLaterRealm){
         self.titleMediaLabel.text = savedMediaList.title

         self.raitingMediaViewCellLabel.text="\( savedMediaList.voteAverage ) "
         setBackdropPathImage(imgPath: savedMediaList.backdropPath)
         self.raitingMediaViewCellLabel.text="\( savedMediaList.voteAverage.roundToDecimal(1)) "
         generesMediaCellLabel.text = savedMediaList.mediaGenreLis
    }

    //MARK: - configure suppot func
    func configureInterfaceSetting (){
        BackdropImageView.layer.cornerRadius = 20
    }
   
    private  func setBackdropPathImage(imgPath: String?){
        guard let img = imgPath else{return}
        let imgUrlString = Const.Request.baseImgUrl+Const.Request.posterSize+img
        let imgUrl = URL(string: imgUrlString)
        self.BackdropImageView.sd_setImage(with: imgUrl)
    }
 
}


    




