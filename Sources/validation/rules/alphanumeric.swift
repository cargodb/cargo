import Foundation

public struct AlphaNumericValidationRule : ValidationRule {
  public var error:ValidationError = .alphaNumeric

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .alphaNumeric), self.error)
    }
  }
}
