import ObjectMapper

class JsonMapper {

    func jsonMapper(_ response: [String : Any]?) throws -> WeahterResponseModel {
        guard
            let jsonAny = response else {
                throw OpenWeatherMapError.mapperErrorResponseNil }
        guard
            let json = Mapper<WeahterResponseModel>().map(JSON: jsonAny) else { throw OpenWeatherMapError.mapperError }
        return json
    }

}
