import ObjectMapper

open class MapWeatherListModel: Mappable {

    public var id: Int?
    public var main: String?
    public var description: String?
    public var icon: String?

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }

}
