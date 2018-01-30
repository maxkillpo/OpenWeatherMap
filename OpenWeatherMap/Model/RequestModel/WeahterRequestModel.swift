import ObjectMapper

class WeahterRequestModel: Mappable {

    var id: String?
    var cnt: String?
    var appid: String?

    init(id: String, cnt: String) {
        self.id = id
        self.cnt = cnt
        self.appid = "47dcb666f2aabf002355af54b5139d8b"
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        cnt <- map["cnt"]
        appid <- map["APPID"]
    }

}
