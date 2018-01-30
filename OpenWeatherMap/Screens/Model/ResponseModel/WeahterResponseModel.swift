import ObjectMapper

class WeahterResponseModel: Mappable {

    var cod: String?
    var message: String?
    var list: [MapListModel]?
    var city: MapCityResponseModel?

    init() { }

    required init?(map: Map) { }

    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        list <- map["list"]
        city <- map["city"]
    }
}

extension WeahterResponseModel {

    func isError() -> WeahterResponseModel {
        return WeahterResponseModel()
    }

}
