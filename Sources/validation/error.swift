import Foundation

public enum ValidationError : Error {
  case `required`
  case alphaNumeric
  case alpha
  case numeric
  case length
  case maxLength
  case minLength
  case email
  case pattern(String)
  case custom(String)
}
