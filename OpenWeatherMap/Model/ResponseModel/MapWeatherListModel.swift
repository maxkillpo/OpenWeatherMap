import ObjectMapper

class MapListModel: Mappable {

    var dt: Int?
    var main: MapMainListModel?
    var weather: [MapWeatherListModel]?

    required init?(map: Map) { }

    func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
    }
}
