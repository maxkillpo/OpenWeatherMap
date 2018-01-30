import ObjectMapper

class JsonMapper {

    func jsonMapper<Response: BaseMappable>(_ response: [String : Any]?) throws -> Response {
        guard
            let jsonAny = response else {
                throw OpenWeatherMapError.mapperErrorResponseNil }
        guard
            let json = Mapper<Response>().map(JSON: jsonAny) else { throw OpenWeatherMapError.mapperError }
        return json
    }

}
