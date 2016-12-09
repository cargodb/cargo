import Foundation

public protocol Validatable {}

extension String:     Validatable {}
extension Set:        Validatable {}
extension Array:      Validatable {}
extension Dictionary: Validatable {}
extension Bool:       Validatable {}
extension Int:        Validatable {}
extension Int8:       Validatable {}
extension Int16:      Validatable {}
extension Int32:      Validatable {}
extension Int64:      Validatable {}
extension UInt:       Validatable {}
extension UInt8:      Validatable {}
extension UInt16:     Validatable {}
extension UInt32:     Validatable {}
extension UInt64:     Validatable {}
extension Float:      Validatable {}
extension Double:     Validatable {}
