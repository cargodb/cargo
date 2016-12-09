import Foundation

public struct CustomValidationRule : ValidationRule {
  public var error:ValidationError

  public private(set) var handler:ValidationHandler

  public init(errorMessage:String, handler:@escaping ValidationHandler) {
    self.error    = ValidationError.custom(errorMessage)
    self.handler  = handler
  }
}
