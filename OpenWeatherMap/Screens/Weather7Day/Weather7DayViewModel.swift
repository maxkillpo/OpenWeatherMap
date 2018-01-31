import RxSwift
import Service

class Weather7DayViewModel: BaseViewModel {

    func requestWeather(cityID: String) -> Observable<WeahterResponseModel> {
        let service = WeatherService()
        return service.callService(request: WeahterRequestModel.init(id: cityID, cnt: "7"))
    }

}
