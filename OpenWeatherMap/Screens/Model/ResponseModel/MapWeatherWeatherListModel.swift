import ObjectMapper

class MapWeatherListModel: Mappable {

    var id: Int?
    var main: String?
    var description: String?
    var icon: String?

    required init?(map: Map) { }

    func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }

}
