import XCTest
@testable import Service

class ServiceTests: XCTestCase {

    func testExample() {
        let exec = expectation(description: "Max")
        _ = WeatherService().callService(request: WeahterRequestModel.init(id: "1609350", cnt: "7"))
            .subscribe(onNext: { response in
                print(response.toJSON())
                exec.fulfill()
            }, onError: { error in

            })
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
