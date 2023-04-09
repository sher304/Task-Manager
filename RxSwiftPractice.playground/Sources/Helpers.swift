import Foundation

public func example(rxOperator: String, action: () -> Void){
    print("\n---- Example of", rxOperator, "---")
    action()
}
