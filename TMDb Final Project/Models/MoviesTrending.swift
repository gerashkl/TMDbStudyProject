import Foundation

struct MoviesTrending : Codable {
	let page : Int?
	let results : [Results]?
	let totalPages : Int?
	let totalResults : Int?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case results = "results"
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}


}




struct TrailerStructResponse : Codable {
    let id : Int?
    let mediaTrailerList : [mediaTrailer]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case mediaTrailerList = "results"
    }

}

struct mediaTrailer : Codable {
//    let id : Int?
//    let mediaTrailerList : String?
    
    let iso639_1: ISO639_1
     let iso3166_1: ISO3166_1
     let name, key: String
     let site: Site
     let size: Int
     let type: String
     let official: Bool
     let publishedAt, id: String

     enum CodingKeys: String, CodingKey {
         case iso639_1 = "iso_639_1"
         case iso3166_1 = "iso_3166_1"
         case name, key, site, size, type, official
         case publishedAt = "published_at"
         case id
     }
 }

 enum ISO3166_1: String, Codable {
     case us = "US"
 }

 enum ISO639_1: String, Codable {
     case en = "en"
 }

 enum Site: String, Codable {
     case youTube = "YouTube"
    }
    
    
    
    
