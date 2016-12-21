import Foundation

public class Database {
  public static var map:[String:Database] = [:]
  public static var `default`:Database?
  public let driver:Driver

  public init(_ driver:Driver) {
    self.driver = driver
  }
}
