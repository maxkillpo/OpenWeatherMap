import ObjectMapper

class WeahterResponseModel: BaseResponseModel {

    var list: [MapListModel]?
    var city: MapCityResponseModel?

    override init() {
        super.init()
    }

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        list <- map["list"]
        city <- map["city"]
    }
}

extension WeahterResponseModel {

    func isError() -> WeahterResponseModel {
        return WeahterResponseModel()
    }

}
