import Foundation

public struct AlphaValidationRule : ValidationRule {
  public var error:ValidationError = .alpha

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .alpha), self.error)
    }
  }
}
