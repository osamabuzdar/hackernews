import Foundation

struct NewsModel: Codable {
    let hits: [Posts]
}

struct Posts: Codable, Identifiable{
    let objectID: String
    let created_at: String
    let title: String
    let url: String?
    let points: Int
    
    
    //computed property for identifiable id
    var id: String{
        return objectID
    }
}
