
import Foundation

struct Global{
    static var mediaType: Const.MediaType = .movie
}

struct Const {
   
    enum MediaType:String {
        case tv = "/tv"
        case movie = "/movie"
        case videos = "/videos"
    }
    enum requestType:String{
        case trending = "/trending"
        case search = "/search"
    }
    enum requestPeriod:String{
        case week = "/week"
    }
    enum ganreList:String{
        case movie = "/genre/movie/list"
        case tv = "/genre/tv/list"
    }
    enum actionCase{
        case mediaInRealm
        case needSaveInRealm
        case needRemoveFromRealm
    }
    
    static let ImgSizeDictionary = ["backdropSize":"w780","posterSize":"w154","profileSize":"h632" ]

    struct Request {
        static let urlForMovie = Const.Request.baseUrl+Const.Request.trendingMovieWeek+Const.Request.apiKey
        static let urlForTV = Const.Request.baseUrl+Const.Request.trendingTVWeek+Const.Request.apiKey
        

        static  let baseUrl = "https://api.themoviedb.org/3"
        static  let trendingMovieWeek = "/trending/movie/week"
        static  let trendingTVWeek = "/trending/tv/week"
        static  let apiKey = "?api_key=41a7178c978b49e1d02a51de566dbf74"
        

        static  let baseImgUrl = "https://image.tmdb.org/t/p/"
        static let posterSize = "w1280"


        static let searchMovie = "/search/movie"
        static let searchTV = "/search/tv"
        static let searchMulti = "/search/multi"
    }
    
    
    struct bildUrl {
       static func trendingMediaWeekUrl(requestType: String,mediaType:String,hesPeriod:Bool) -> String{
            let requestPeriod2 = "/week"
           let url:String = Const.Request.baseUrl+requestType+mediaType+requestPeriod2+Const.Request.apiKey
      return url
        }
    }
    
    static func bildSearchUrl(mediaType:String,searchText:String) -> String{
           let url:String = Const.Request.baseUrl+Const.requestType.search.rawValue+mediaType+Const.Request.apiKey+"&query=\(searchText)"
            return url
        }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
