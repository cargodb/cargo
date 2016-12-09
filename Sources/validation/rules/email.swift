import Foundation

public struct EmailValidationRule : ValidationRule {
  public var error:ValidationError = .email

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .email), self.error)
    }
  }
}
