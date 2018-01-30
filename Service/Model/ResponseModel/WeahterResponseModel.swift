import ObjectMapper

open class WeahterResponseModel: BaseResponseModel {

    public var list: [MapListModel]?
    public var city: MapCityResponseModel?

    public override init() {
        super.init()
    }

    public required init?(map: Map) {
        super.init(map: map)
    }

    public override func mapping(map: Map) {
        super.mapping(map: map)
        list <- map["list"]
        city <- map["city"]
    }
}

extension WeahterResponseModel {

    public func isError() -> WeahterResponseModel {
        let isFalse = WeahterResponseModel()
        isFalse.city?.name = "Not have city"
        return isFalse
    }

}
