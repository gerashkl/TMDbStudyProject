
import UIKit
import Foundation
import Alamofire

extension MediaViewController {
    
    func loadTrendingMovies(url:String) {
        MediaViewControllerViewModel.NetworkManager().loadMedia(url: url){ mediaArrey in
            self.mainMediaDataList = mediaArrey
            self.mediaTableView.reloadData()
        }
    }
    
    func searchMedia (url:String) {
        
        MediaViewControllerViewModel.NetworkManager().loadMedia(url: url){ mediaArrey in
            self.mainMediaDataList = mediaArrey
            self.mediaTableView.reloadData()
        }
    }
   
}



struct MediaViewControllerViewModel {
    static var allGenersArrey: [Genres] = []
    static var MediaType = Const.MediaType.movie
    var searchTextRename = ""
    
    func loadGenreList(ganreList:String) {
        let ganreList = ganreList
        let genreUrl = Const.Request.baseUrl+ganreList+Const.Request.apiKey
        MediaViewControllerViewModel.NetworkManager().loadGenersList(url: genreUrl){ genreListArrey in
            MediaViewControllerViewModel.allGenersArrey += genreListArrey
        }
    }
    

    struct NetworkManager  {
        
        func loadMedia(url: String, completition: @escaping([Results])->()){
            AF.request(url,method: .get).responseDecodable(of: MoviesTrending.self){ TrendingResponse in
                let allData = TrendingResponse.value
                completition(allData?.results ?? [])
            }
        }
        
        func loadGenersList(url:String,completition: @escaping([Genres])->()){
            
            AF.request(url,method: .get).responseDecodable(of: GenresStructResponse.self){ genreList in
                let allData = genreList.value
                completition(allData?.genres ?? [])
                
            }
        }

        func loadTrailerList(mediaID:Int,mediaType: String,completition: @escaping([mediaTrailer])->()){
            let mediaID = String(mediaID)
            let getTrailerUrl=Const.Request.baseUrl+"/"+mediaType+"/"+mediaID+Const.MediaType.videos.rawValue+Const.Request.apiKey
            
            AF.request(getTrailerUrl,method: .get).responseDecodable(of: TrailerStructResponse.self){ mediaArrey in
                let mediaArrey = mediaArrey.value
                completition(mediaArrey?.mediaTrailerList ?? [])
            }            
        }
    }
}

