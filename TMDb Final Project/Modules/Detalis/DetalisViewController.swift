import UIKit
import RealmSwift
//import SDWebImage
import YouTubeiOSPlayerHelper


class DetalisViewController: UIViewController {
    @IBOutlet weak var playerDetalisView: YTPlayerView!
    @IBOutlet weak var saveMediaButton: UIButton!
    @IBOutlet weak var owerviewDetalisLabel: UILabel!
    @IBOutlet weak var titleDetalisLabel: UILabel!
    @IBOutlet weak var releaseDateDetalisLabel: UILabel!
    @IBOutlet weak var genresDetalisLabel: UILabel!
    @IBOutlet weak var raitingDetalisLabel: UILabel!
    @IBOutlet weak var contentDetalisScrollView: UIView!
    @IBOutlet weak var backdropMediaDetalisImageView: UIImageView! 
    var mediaDetalis : Results?
    var savedMediaDetalis: WathLaterRealm?
    var trailerList: [mediaTrailer]=[]
    var mediaID = ""
    
    var viewModel = DetalisViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureVC()
        self.configureSavedMediaVC()
    }
    
    //MARK: - Action
    @IBAction private func saveMediaButtonPressed(_ sender: Any) {
        saveMediaButtonPressed ()
        delateMediaButtonPressed ()
    }

    
    //MARK: - func saveMediaButtonPressed
    
    func saveMediaButtonPressed (){
        guard let mediaDetalis = mediaDetalis else{ return }
        if DataManager.checkItemInRealm(mediaId:mediaDetalis.id!){
            buttomAllertAction(actionCase: Const.actionCase.mediaInRealm)
        }
        buttomAllertAction(actionCase: Const.actionCase.needSaveInRealm)
    }
    func delateMediaButtonPressed (){
        buttomAllertAction(actionCase: Const.actionCase.needRemoveFromRealm)
    }
    
}
