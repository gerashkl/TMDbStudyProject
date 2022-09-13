import Foundation

struct Results : Codable {
	let adult : Bool?
	let backdropPath : String?
	let id : Int?
	let title : String?
	let originalLanguage : String?
	let originalTitle : String?
	let overview : String?
	let posterPath : String?
	let mediaType : String?
	let genreIDS : [Int]?
	let popularity : Double?
	let releaseDate : String?
	let video : Bool?
	let voteAverage : Double?
	let voteCount : Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdropPath = "backdrop_path"
		case id = "id"
		case title = "title"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview = "overview"
		case posterPath = "poster_path"
		case mediaType = "media_type"
		case genreIDS = "genre_ids"
		case popularity = "popularity"
		case releaseDate = "release_date"
		case video = "video"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
        case name
                case originalName = "original_name"
                case firstAirDate = "first_air_date"
                case originCountry = "origin_country"
	}
}
