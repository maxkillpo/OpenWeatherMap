import ObjectMapper

open class WeahterRequestModel: Mappable {

    public var id: String?
    public var cnt: String?
    public var appid: String?

    public init(id: String, cnt: String) {
        self.id = id
        self.cnt = cnt
        self.appid = "47dcb666f2aabf002355af54b5139d8b"
    }

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        id <- map["id"]
        cnt <- map["cnt"]
        appid <- map["APPID"]
    }

}
