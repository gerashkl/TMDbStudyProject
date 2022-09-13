
import Foundation

struct GenresStructResponse : Codable {
    let genres : [Genres]?
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
}


struct Genres : Codable {
    let id : Int?
    let name : String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}



func mediaGenreNamesList (genresIDFromMedia:[Int]?,genreList:[Genres]) -> [String]{
    guard let genresIDFromMedia = genresIDFromMedia else{return []}
    var mediaGenreNames:[String] = []
    for (_, item) in genreList.enumerated(){
        for genresId in genresIDFromMedia{
            if item.id == genresId{
                mediaGenreNames.insert(item.name ?? "0", at: 0)
            }
        }
    }
    return mediaGenreNames
}

func setGenreLis(genreIds:[Int]?) -> String{
    
    var mediaGenreList:[String]=[]
    var mediaGanre = ""
    
    mediaGenreList =  mediaGenreNamesList(
        genresIDFromMedia: genreIds,
        genreList: MediaViewControllerViewModel.allGenersArrey)
    for genre in mediaGenreList{
        mediaGanre += "\(genre)|"
    }
    return mediaGanre
}






