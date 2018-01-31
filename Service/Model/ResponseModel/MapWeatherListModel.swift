import ObjectMapper

open class MapListModel: Mappable {

    public var dt: Int?
    public var main: MapMainListModel?
    public var weather: [MapWeatherListModel]?
    public var dt_txt: String?

    public init() {}

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        dt_txt <- map["dt_txt"]
    }
}
