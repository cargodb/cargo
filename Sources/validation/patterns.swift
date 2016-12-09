import Foundation

public enum ValidationPattern {
  case length(UInt, UInt)
  case email
  case url
  case alphaNumeric
  case alpha
  case numeric
  case custom(pattern:String)

  var string:String {
    switch self {
    case .length(let min, let max):
      return "[0-9]{\(min),\(max)}"

    case .email:
      return "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

    case .url:
      return "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"

    case .alphaNumeric:
      return "^[0-9a-zA-Z]+"

    case .alpha:
      return "^[a-zA-Z]+"

    case .numeric:
      return "[0-9]+"

    case .custom(let pattern):
      return pattern
    }
  }
}

