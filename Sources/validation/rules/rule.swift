import Foundation

public protocol ValidationRule {
  var error:ValidationError       { get }
  var handler:ValidationHandler   { get }
}
