import Foundation

public struct RequiredValidationRule : ValidationRule {
  public var error:ValidationError = .required

  public var handler:ValidationHandler {
    return { value in
      guard let val = value else { return (false, self.error) }

      return ((String(describing:val).characters.count > 0), self.error)
    }
  }
}
