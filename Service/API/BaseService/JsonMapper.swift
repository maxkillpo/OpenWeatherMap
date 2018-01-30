import ObjectMapper

class JsonMapper {

    static let shareInstance = JsonMapper()

    func mapper<Response: BaseMappable>( _ response: Any?) throws -> Response {
        guard
            let json = Mapper<Response>().map(JSONObject: response) else {
                throw OpenWeatherMapError.mapperError
        }
        return json
    }

}
