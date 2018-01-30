import ObjectMapper

class BaseResponseModel: Mappable {

    var cod: Int?
    var message: String?

    init() { }

    required init?(map: Map) {}

    func mapping(map: Map) {

        cod <- map["cod"]
        message <- map["message"]


    }

}
