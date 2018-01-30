import ObjectMapper

open class MapCityResponseModel: Mappable {
    public var id: Int?
    public var name: String?
    public var lat:Double?
    public var lon: Double?
    public var country: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        lat <- map["coord.lat"]
        lon <- map["coord.lon"]
        country <- map["country"]
    }
}
