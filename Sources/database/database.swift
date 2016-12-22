import Foundation

public class Database {
  private let config:DBConfig

  public init(_ config:DBConfig) {
    self.config = config
  }

  public func query(_ query:String) -> Any? {
    return nil
  }
}
