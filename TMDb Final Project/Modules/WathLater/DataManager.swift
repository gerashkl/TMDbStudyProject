import Foundation
import RealmSwift

struct DataManager {
    let realm = try? Realm()
    static let shared = DataManager()
    
    func saveDataToRealm(moviesList: Results?){
        guard let moviesList =  moviesList else{return}
        let wathLaterListRealm :WathLaterRealm  = WathLaterRealm()
        wathLaterListRealm.backdropPath = moviesList.backdropPath ?? ""
        wathLaterListRealm.id = moviesList.id ?? 0
        wathLaterListRealm.title = moviesList.title ?? moviesList.name ?? ""
        wathLaterListRealm.overview = moviesList.overview ?? ""
        wathLaterListRealm.posterPath = moviesList.posterPath ?? ""
        wathLaterListRealm.mediaType = moviesList.mediaType ?? ""
        wathLaterListRealm.mediaGenreLis = setGenreLis(genreIds:moviesList.genreIDS)
        wathLaterListRealm.releaseDate = moviesList.releaseDate ?? moviesList.firstAirDate!
        wathLaterListRealm.voteAverage = moviesList.voteAverage ?? 0.0
        try? realm?.write {
            realm?.add(wathLaterListRealm)
        }
    }
    
    func getWathLaterList() ->[WathLaterRealm] {
        var moviesFromRealm :[WathLaterRealm] = []
        guard let movieResults = realm?.objects(WathLaterRealm.self) else{return []}
        for movie in movieResults {
            moviesFromRealm.append(movie)
        }
        return moviesFromRealm
    }
    
    func deleteWathLaterList(item: WathLaterRealm){
        do{
            try realm?.write({
                realm?.delete(item)
            })
        }
        catch{
            print("error when deleting data")
        }
    }
    
    static func checkItemInRealm(mediaId: Int) -> Bool{
        let savedMediaList = DataManager.shared.getWathLaterList()
        var itemInRealm:Bool = false
        for (item) in savedMediaList{
            if mediaId == item.id {itemInRealm = true }
        }
        return itemInRealm
    }
}
