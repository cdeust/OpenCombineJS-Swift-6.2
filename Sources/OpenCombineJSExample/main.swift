import JavaScriptKit
import OpenCombine
import OpenCombineJS

@MainActor
func main() {
  let jsFetch = JSObject.global.fetch.function!

  func fetch(_ url: String) -> JSPromise {
    JSPromise(jsFetch(url).object!)!
  }

  let document = JSObject.global.document
  var p = document.createElement("p")
  _ = document.body.appendChild(p)

  var subscription: AnyCancellable?

  _ = JSTimer(millisecondsDelay: 1000, isRepeating: true) {
    subscription = fetch("https://httpbin.org/uuid")
      .publisher
      .flatMap {
        JSPromise($0.json().object!)!.publisher
      }
      .mapError { $0 as Error }
      .map { Result<String, Error>.success($0.uuid.string!) }
      .catch { Just(.failure($0)) }
      .sink {
        let time = JSDate().toLocaleTimeString()
        switch $0 {
        case let .success(uuid):
          p.innerText = .string("At \(time) received uuid \(uuid)")
        case let .failure(error):
          p.innerText = .string("At \(time) received error \(error)")
        }
      }
  }

  _ = subscription
}

main()
