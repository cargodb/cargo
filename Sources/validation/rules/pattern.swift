import Foundation

public struct PatternValidationRule : ValidationRule {
  public var error:ValidationError

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .alpha), self.error)
    }
  }

  private let pattern:ValidationPattern

  public init(_ pattern:String) {
    self.error    = .pattern(pattern)
    self.pattern  = ValidationPattern.custom(pattern:pattern)
  }
}
