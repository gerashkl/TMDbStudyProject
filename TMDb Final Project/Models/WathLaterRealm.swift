import Foundation
import RealmSwift

class WathLaterRealm: Object {
    
    @objc dynamic var backdropPath : String = ""
    @objc dynamic var id : Int = 0
    @objc dynamic var title : String = ""
    @objc dynamic var overview : String = ""
    @objc dynamic var posterPath : String = ""
    @objc dynamic var mediaType : String = ""
    @objc dynamic var mediaGenreLis : String = ""    
//    @objc dynamic var popularity : Double = 0
    @objc dynamic var releaseDate : String = ""
//    @objc dynamic var video : Bool
    @objc dynamic var voteAverage : Double = 0.0
//    @objc dynamic var voteCount : Int = 0
//    @objc dynamic var name :String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }

}






