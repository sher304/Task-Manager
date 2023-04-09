import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


example(rxOperator: "Publish Subject") {
    let disposableBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    
    subject.subscribe { event in
        print("First subscriber")
        print(event)
    }.disposed(by: disposableBag)
    
    subject.on(Event<String>.next("Hello on Subject"))
    subject.onNext("Hello OnNext Subject")
    
    subject.subscribe {
        print("Second Subscriber")
        print($0)
    }.disposed(by: disposableBag)
    
    subject.onNext("Hello second subscriber")
    
}
 
