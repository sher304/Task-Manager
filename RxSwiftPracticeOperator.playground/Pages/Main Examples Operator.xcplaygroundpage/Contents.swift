//: A SpriteKit based Playground

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import RxSwift

//MARK: Simple operator, took one value
//example(rxOperator: "just") {
//    let obeservable = Observable.just("Hello, RxSwift")
//    obeservable.subscribe { event in
//        print(event)
          //MARK: HELLO, RxSwift
//    }
//}


//MARK: OF Operator
//example(rxOperator: "of") {
//    let observable = Observable.of("Hello", "RxSwift")
//    observable.subscribe() {
//        print($0)
          //MARK: HELLO
          //MARK: RxSwift
//    }
//}

//MARK: Not correct way to Dispose
//example(rxOperator: "Dispose") {
//    let items = [1, 2, 5, 2]
//    Observable.from(items).subscribe { event in
//        print(event)
//    }.dispose()
//}

//MARK: Safety was to dispose
//example(rxOperator: "DisposeBag") {
//    let disposeBag = DisposeBag()
//    let items = [1, 2, 3]
//    Observable.from(items).subscribe { event in
//        print(event)
//    }.disposed(by: disposeBag)
//}


//MARK: Safety was to dispose
//example(rxOperator: "Take Until") {
//    let items = [1, 2, 3, 4]
//    let stopSeq = Observable.just(1).delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
//    let sequence = Observable.from(items).take(until: stopSeq)
//    sequence.subscribe { event in
//        print(event)
//    }
//}


//MARK: FILTER

//example(rxOperator: "FILTER") {
//    let items = [1, 20, 15, 2, 50]
//    let observable = Observable.from(items).filter({$0 > 10})
//    _ = observable.subscribe({ event in
//        print(event)
//    })
//}


//MARK: MAP

//example(rxOperator: "MAP") {
//    let items = [1, 30, 20, 50]
//    let observable = Observable.from(items).map({$0 * 10})
//    _ = observable.subscribe({ event in
//        print(event)
//    })
//}


//MARK: MERGE

//example(rxOperator: "MERGE") {
//    let items = Observable<AnyObject>.of("a" as AnyObject, "b" as AnyObject, "c" as AnyObject)
//    let secondItems = Observable<AnyObject>.of(1 as AnyObject, 2 as AnyObject, 3 as AnyObject)
//    let observable = Observable.merge(items, secondItems)
//    _ = observable.subscribe({ event in
//        print(event)
//    })
//}

//MARK: MERGE
//example(rxOperator: "MERGE") {
//    let items = Observable.of(1, 2, 3)
//    let secondItems = Observable.of(4, 5, 6)
//    let observable = Observable.merge(items, secondItems)
//    _ = observable.subscribe({ event in
//        print(event)
//    })
//}
//
