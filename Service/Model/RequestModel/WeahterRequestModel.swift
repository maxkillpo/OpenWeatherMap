import ObjectMapper

open class WeahterRequestModel: Mappable {

    public var q: String?
    public var cnt: String?
    public var appid: String?

    public init(id: String, cnt: String) {
        self.q = id
        self.cnt = cnt
        self.appid = "47dcb666f2aabf002355af54b5139d8b"
    }

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        q <- map["q"]
        cnt <- map["cnt"]
        appid <- map["APPID"]
    }

}
