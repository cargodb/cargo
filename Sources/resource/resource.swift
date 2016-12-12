import Foundation
import validation

open class Resource : Equatable {
  public static var tableName:String {
    return String(describing: self).lowercased().pluralize()
  }

  final private let lock                                    = DispatchSemaphore(value:1)
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

  public subscript(key:String) -> Validatable? {
    get {
      return properties[key]?.value
    }

    set {
      properties[key]?.value = newValue
    }
  }
}


public func ==(lhs:Resource, rhs:Resource) -> Bool {
  return String(describing: lhs).lowercased() == String(describing: rhs).lowercased()
}
