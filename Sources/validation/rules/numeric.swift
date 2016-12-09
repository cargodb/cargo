import Foundation

public struct NumericValidationRule : ValidationRule {
  public var error:ValidationError = .numeric

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .numeric), self.error)
    }
  }
}
