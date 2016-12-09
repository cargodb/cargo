import Foundation

public struct LengthValidationRule : ValidationRule {
  public var error:ValidationError = .length

  private let min:UInt
  private let max:UInt

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return (validate(val, pattern: .length(self.min, self.max)), self.error)
    }
  }

  public init(min:UInt = 1, max:UInt = 5000) {
    self.min = min
    self.max = max
  }
}
