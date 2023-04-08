//
//  Dynamic.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation


class Dynamic<T>{
    
    typealias Listener = (T) -> Void
    var listener: Listener?

    func bind(_ listener: Listener?){
        self.listener = listener
    }
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ v: T){
        value = v
    }
    
}
