import ObjectMapper

class MapCityResponseModel: Mappable {
    var id: Int?
    var name: String?
    var lat:Double?
    var lon: Double?
    var country: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        lat <- map["coord.lat"]
        lon <- map["coord.lon"]
        country <- map["country"]
    }
}
