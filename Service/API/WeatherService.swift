import RxSwift

open class WeatherService: BaseService<WeahterResponseModel> {

    public override init() {
        super.init()
    }

    open func callService( request: WeahterRequestModel) -> Observable<WeahterResponseModel>  {
        return buildRequest(url: Router.forecast(parameters: request.toJSON()))
    }

}
