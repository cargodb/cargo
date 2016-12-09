import Foundation
import validation

public class Property {
  public let type:PropertyType
  public var value:Validatable?
  public let validation:[Validation]
  public private(set) var errors:[ValidationError] = []

  public var isValid:Bool {
    errors.removeAll()

    var _isValid = true

    for validator in validation {
      let result = validator.rule.handler(value)

      _isValid = result.0

      if !_isValid, let error = result.1 {
        errors.append(error)
      }
    }

    return _isValid
  }

  public init(_ type:PropertyType, validation:[Validation] = [], defaultValue:Validatable? = nil) {
    self.type       = type
    self.validation = validation
    self.value      = defaultValue
  }
}
