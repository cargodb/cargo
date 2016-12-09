import Foundation
import validation

open class Resource {
  final private let lock = DispatchSemaphore(value:1)
  public private(set) var errors:[String:[ValidationError]] = [:]
  final public lazy var properties:[String:Property] = {
    self.lock.wait(); defer { self.lock.signal() }

    return Mirror(reflecting: self).children.filter({ $0.1 is Property }).reduce([:]) { current, next in
      guard let key = next.0, let value = next.1 as? Property else { return current }

      var dict = current

      dict[key] = value

      return dict
    }
  }()

  final public var isValid:Bool {
    var errorCount = 0
    
    errors.removeAll()
    for (name, property) in properties {
      if property.isValid == false {
        errors[name] = property.errors
        
        errorCount += 1
      }
    }
    
    return errorCount == 0
  }

  public init() {}

  subscript(key:String) -> Validatable? {
    get {
      return properties[key]?.value
    }

    set {
      properties[key]?.value = newValue
    }
  }
}

