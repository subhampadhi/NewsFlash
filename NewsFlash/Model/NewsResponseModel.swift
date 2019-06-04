import Foundation

struct Result : Codable {
    
    let error : [String]?
    let message : Message?
    let status_code : Int?

}

struct Message : Codable {
    
    let breaking_news : [String]?
    let latest_news : [LatestNew]?
    let main_story : MainStory?
}

struct MainStory : Codable {
    
    let article_url : String?
    let id : String?
    let title : String?
    let type : String?
    let updateAt : String?
    let url : String?
}

struct LatestNew : Codable {
    
    let article_desc : String?
    let article_url : String?
    let id : String?
    let type : String?
    let updateAt : String?
    let url : String?
}
