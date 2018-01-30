import ObjectMapper

open class MapMainListModel: Mappable {
    
    public var temp: Double?
    public var temp_min: Double?
    public var temp_max: Double?
    public var pressure: Double?
    public var sea_level: Double?
    public var grnd_level: Double?
    public var humidity: Int?
    public var temp_kf: Double?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        temp <- map["temp"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        sea_level <- map["sea_level"]
        grnd_level <- map["grnd_level"]
        humidity <- map["humidity"]
        temp_kf <- map["temp_kf"]
    }
}
