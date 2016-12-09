import Foundation

public typealias ValidationHandler = (Validatable?) -> (Bool, ValidationError?)

public enum Validation {
  case `required`
  case alphaNumberic
  case alpha
  case numeric
  case length(UInt)
  case maxLength(UInt)
  case minLength(UInt)
  case email
  case pattern(String)
  case custom(String, ValidationHandler)

  public var rule:ValidationRule {
    switch self {
      case .required:
        return RequiredValidationRule()
      case .alphaNumberic:
        return AlphaNumericValidationRule()
      case .alpha:
        return AlphaValidationRule()
      case .numeric:
        return NumericValidationRule()
      case .length(let len):
        return LengthValidationRule(min:len, max:len)
      case .maxLength(let len):
        return LengthValidationRule(max:len)
      case .minLength(let len):
        return LengthValidationRule(min:len)
      case .email:
        return EmailValidationRule()
      case .pattern(let pattern):
        return PatternValidationRule(pattern)
      case .custom(let msg, let block):
        return CustomValidationRule(errorMessage:msg, handler:block)
    }
  }
}

internal func validate(_ value:Validatable, pattern:ValidationPattern) -> Bool {
  do {
    let str     = String(describing:value)
    let regex   = try NSRegularExpression(pattern: pattern.string, options: [.caseInsensitive])
    let matches = regex.matches(in: str, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))

    return matches.count > 0 ? true : false
  } catch {
    return false
  }
}
