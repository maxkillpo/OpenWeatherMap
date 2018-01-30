import ObjectMapper

open class BaseResponseModel: Mappable {

    public var cod: String?
    public var message: String?

    public init() { }

    public required init?(map: Map) {}

    public func mapping(map: Map) {

        cod <- map["cod"]
        message <- map["message"]

    }

}
