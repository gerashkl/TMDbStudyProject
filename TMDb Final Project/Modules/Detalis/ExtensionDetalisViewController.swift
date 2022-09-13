import UIKit
import Foundation


extension DetalisViewController {
    func configureVC (){
        guard let mediaDetalis = mediaDetalis else {return}
        titleDetalisLabel.text = mediaDetalis.title ?? mediaDetalis.name
        owerviewDetalisLabel.text=mediaDetalis.overview
        releaseDateDetalisLabel.text = mediaDetalis.releaseDate ?? mediaDetalis.firstAirDate
        genresDetalisLabel.text = setGenreLis(
            genreIds:mediaDetalis.genreIDS)
        raitingDetalisLabel.text="\( mediaDetalis.voteAverage?.roundToDecimal(1) ?? 0) "
        viewModel.setImage(
            imgPath:mediaDetalis.posterPath,imageView:backdropMediaDetalisImageView)
        loadTrailer(
            mediaID: mediaDetalis.id ?? 0, mediaType: mediaDetalis.mediaType ?? "")
        saveMediaButton.setTitle("Save", for: .normal)
        DetalisViewControllerUI()
    }
    
    
    func configureSavedMediaVC () {
        guard let savedMediaDetalis = savedMediaDetalis else {return}
        
        viewModel.mediaTaitle = savedMediaDetalis.title
        titleDetalisLabel.text =  viewModel.mediaTaitle
        owerviewDetalisLabel.text = savedMediaDetalis.overview
        releaseDateDetalisLabel.text = savedMediaDetalis.releaseDate
        genresDetalisLabel.text = savedMediaDetalis.mediaGenreLis
        raitingDetalisLabel.text="\(savedMediaDetalis.voteAverage.roundToDecimal(1)) "
        viewModel.setImage(
            imgPath: savedMediaDetalis.posterPath , imageView:backdropMediaDetalisImageView)
        loadTrailer(
            mediaID: savedMediaDetalis.id, mediaType: savedMediaDetalis.mediaType )
        saveMediaButton.setTitle("Remove", for: .normal)
        DetalisViewControllerUI()
    }
    func DetalisViewControllerUI(){
        contentDetalisScrollView.layer.cornerRadius = 20
    }
    
    //MARK: - prived func
    
    private func loadTrailer(mediaID:Int,mediaType:String) {
        MediaViewControllerViewModel.NetworkManager().loadTrailerList(mediaID: mediaID, mediaType: mediaType ){ mediaArrey in
            self.playerDetalisView.load(withVideoId: mediaArrey.last?.key ?? "")
        }
        
    }
    
    //MARK: - buttomAllertAction
    
    func buttomAllertAction (actionCase: Const.actionCase){
        let saveMediaButtonPresedAlert = viewModel.createAlertController(actionCase: actionCase, titleMovie: titleDetalisLabel.text)
        
        switch actionCase{
        case .mediaInRealm : do {
            let canselAction = UIAlertAction(title:"Got it", style: .cancel)
            saveMediaButtonPresedAlert.addAction(canselAction)
            present(saveMediaButtonPresedAlert, animated: true)
            return
        }
        case .needSaveInRealm : do {
            let saveAction = UIAlertAction(title: "Save", style: .default) {action in
                DataManager.shared.saveDataToRealm(moviesList: self.mediaDetalis )
            }
            let canselAction = UIAlertAction(title:"Cancel", style: .cancel)
            saveMediaButtonPresedAlert.addAction(saveAction)
            saveMediaButtonPresedAlert.addAction(canselAction)
            present(saveMediaButtonPresedAlert, animated: true)
        }
            
        case Const.actionCase.needRemoveFromRealm : do {
            guard let savedMediaDetalis = savedMediaDetalis else{ return }
            
            let delateAction = UIAlertAction(title: "Remove", style: .default) {action in
                DataManager.shared.deleteWathLaterList(item: savedMediaDetalis)
                //need close the View after this event
            }
            let canselAction = UIAlertAction(title:"Cancel", style: .cancel)
            saveMediaButtonPresedAlert.addAction(delateAction)
            saveMediaButtonPresedAlert.addAction(canselAction)
            present(saveMediaButtonPresedAlert, animated: true)
        }
        }
    }
}



